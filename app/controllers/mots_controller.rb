class MotsController < ApplicationController
  before_filter :authenticate

  def create
  @mot = current_user.mots.build(params[:mot])
    if @mot.save
    flash[:success] = "Your M.O.T has been saved"
    redirect_to root_path
   else
    render 'pages/home'
  end
  end

  def mothome
   
  end

  def destroy

  end

end
