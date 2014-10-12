class StaticsController < ApplicationController
  def home
    if current_driver
      redirect_to 
    elsif current_volunteer
      redirect_to tags_path
    end
  end
end