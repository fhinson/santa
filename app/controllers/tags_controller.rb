class TagsController < ApplicationController
  def index 
    @tags = Tag.all
  end

  def show 
    @tag = Tag.find_by_code!(params[:id])
  end

  def id_from_code
    render json: Tag.find_by_code(params[:code]).id
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :age, :gender, :wish, :alternative_wish, :status, :zone, :code)
  end
end