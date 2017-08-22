class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])

    if @user
      if @user.try(:authenticate, params[:password])
        session[:user_id] = @user.id
        return redirect_to '/shoes'
      end
      flash[:errors] = ["Password not valid"]
    end

    flash[:errors] = ["Email account not valid"]
    return redirect_to :back
  end

  def destroy
    session.clear
    return redirect_to '/'
  end
end
