class SessionsController < ApplicationController
  def new
    @title = "Sign In"
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
  if user.nil?
    flash[:notice] = fading_flash_message("The login details were incorrecct, please re-enter", 5)
     @title = "Sign In to MOTAS"
     render 'new'
      else
        sign_in user
        redirect_back_or user
  end
  end

    def destroy
      sign_out
      redirect_to root_path
    end
end
