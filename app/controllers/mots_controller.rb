class MotsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def create
  @mot = current_user.mots.build(params[:mot])
    if @mot.save
    flash[:success] = "Your M.O.T has been saved"
    redirect_to current_user #root_path
   else
    render 'pages/home'
  end
  end

  def show
   
  end

  def destroy
   @mot.destroy
   redirect_to current_user  #_back or root_path
  end

  private

  def authorized_user
    @mot = Mot.find(params[:id])
    redirect_to root_path unless current_user?(@mot.user)
  end

end
