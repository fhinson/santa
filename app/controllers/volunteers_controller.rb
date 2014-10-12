class VolunteersController < ApplicationController
  def check_delivered
    @tag = Tag.find(params[:id])
    @tag.status = "Delivered"
    @tag.zone = 023
    @tag.save
  end
end