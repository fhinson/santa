class VolunteersController < ApplicationController
  def check_delivered
    @tag = Tag.find(params[:id])
    @tag.status = "Delivered"
    @tag.zone = 023
    @tag.save

    Pusher['volunteer_channel'].trigger('deliver', {
      message: 'Present delivered!'
    })

    render nothing: true
  end

  def check_undelivered
    @tag = Tag.find(params[:id])
    @tag.status = "Not Delivered"
    @tag.save

    render nothing: true
  end
end