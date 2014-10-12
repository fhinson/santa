class DriversController < ApplicationController
  before_action :authenticate_driver!, only: :index

	def index

	end

	def notify
		tag = Tag.find(params[:id])
		dl = params[:location]
		dp = params[:phone]
		tag.location = dl
		tag.phone = dp
		tag.status = "Requested"
		tag.save
		
		numbers = []
		#send_text_message
		Driver.all.each do |d|
			if d.location?
				loc = parse_location(d.location)
				donorLoc = parse_location(dl)
				miles = haversine_distance(loc[0], loc[1], donorLoc[0], donorLoc[1])
				if (miles < 5)
					numbers << d.phone
					puts d.phone
				end
			end
		end

		send_text_message(numbers, dl)

		render nothing: true
	end

	def send_text_message(numbers, loc)
		@twilio_client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"]

		for num in numbers
			@twilio_client.account.sms.messages.create(
				:from => "+1#{ENV['TWILIO_PHONE_NUMBER']}",
				:to => "+1" + num,
				:body => "Hello - a present delivery has been requested. Please click the following link to view the request: " + drivers_url
			)
		end
	end

	def parse_location(st)
		arr = []
		result = st.split(',')
		arr[0] = result[0].strip.to_f
		arr[1] = result[1].strip.to_f
		return arr
	end

	def haversine_distance( lat1, lon1, lat2, lon2 )
		max_distance_away_in_km = 100.0
		rad_per_deg             = 0.017453293

		rmiles  = 3956           # radius of the great circle in miles
		rkm     = 6371           # radius in kilometers, some algorithms use 6367
		rfeet   = rmiles * 5282  # radius in feet
		rmeters = rkm * 1000     # radius in meters
		dlon = lon2 - lon1
		dlat = lat2 - lat1

		dlon_rad = dlon * rad_per_deg
		dlat_rad = dlat * rad_per_deg

		lat1_rad = lat1 * rad_per_deg
		lon1_rad = lon1 * rad_per_deg

		lat2_rad = lat2 * rad_per_deg
		lon2_rad = lon2 * rad_per_deg

		a = (Math.sin(dlat_rad/2))**2 + Math.cos(lat1_rad) *
		Math.cos(lat2_rad) * (Math.sin(dlon_rad/2))**2
		c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))

	  dmi     = rmiles * c      # delta between the two points in miles
	  dkm     = rkm * c         # delta in kilometers
	  dfeet   = nil #rfeet * c       # delta in feet
	  dmeters = nil #rmeters * c     # delta in meters

	  return dmi
	end

end