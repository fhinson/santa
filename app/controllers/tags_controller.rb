class TagsController < ApplicationController
  def index 
    @tags = Tag.all
  end

  def show 
    @tag = Tag.find(params[:id])

    qr = RQRCode::QRCode.new('http://localhost:3000', :size => 4, :level => :h )
    @png = qr.to_img
    @png.resize(90, 90).save("qr_code")
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :age, :gender, :wish, :alternative_wish, :status, :zone, :code)
  end
end