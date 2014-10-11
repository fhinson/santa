class TagController < ApplicationController
  def index 
    @tags = Tag.all
  end

  def show 
    @tag = Tag.find(params[:id])
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :age, :gender, :wish, :alternative_wish, :status, :zone, :code)
  end
end