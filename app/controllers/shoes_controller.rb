class ShoesController < ApplicationController
  def index
    @shoes = Shoe.where(buyer: nil)
  end

  def create
    @shoe = Shoe.new(shoe_params)
    p @shoe
    if @shoe.valid?
        @shoe.save
        p "HEY FUCKER RIGHT HERE"
        flash[:notice] = ["Posted Successfully"]

        return redirect_to :back
    end
    p @shoe.errors.full_messages
    flash[:errors] = @shoe.errors.full_messages

    return redirect_to :back
  end

  def buy
    Shoe.find(params[:id]).update(buyer: current_user)
		redirect_to :back
  end

  def destroy
    shoe = Shoe.find(params[:id])
    shoe.destroy if current_user == shoe.seller
    redirect_to :back
  end

  private
    def shoe_params
      params.require(:shoe).permit(:name, :price).merge(seller: current_user)
    end
end
