class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    p user
    if user.valid?
        user.save
        flash[:notice] = ["Registered Successfully"]
        session[:user_id] = user.id
        return redirect_to '/shoes'
    end
    p user.errors.full_messages
    flash[:errors] = user.errors.full_messages

    return redirect_to '/'
  end

  def show
    @to_sell = Shoe.where(seller: current_user, buyer: nil)
		@sold = current_user.sellers.where.not(buyer: nil)
		@bought = Shoe.where(buyer: current_user)
		@total_bought = Shoe.where(buyer: current_user).sum(:price)
		@total_sold = current_user.sellers.where.not(buyer: nil).sum(:price)
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def authorization
      return redirect_to '/' unless session[:user_id].to_s == params[:id]
    end
end
