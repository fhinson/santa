namespace :tags do 
  task :seed_codes => :environment do
    Tag.find_each do |t|
      t.code = SecureRandom.hex(4).upcase
      t.save
    end
  end
end