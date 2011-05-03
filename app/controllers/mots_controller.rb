class MotsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  attr_accessor

  def create
  @mot = current_user.mots.build(params[:mot])
    if @mot.save
    flash[:success] = "Your M.O.T has been saved"
    redirect_to current_user 
   else
    render 'pages/home'
  end
  end

  def index
      @title = "All MOTAS bookings"
      @users = User.find(:all)
   #    @users = User.mot_date
      @mots = Mot.find(:all)
    #  @mots = @user.mots.paginate(:page => params[:page])
     @date = params[:month] ? Date.parse(params[:month].gsub('-', '/')) : Date.today
    #  @date = params[:month] ? Date.parse(params[:month]) : Date.today
     # @mots = @user.mots.find(:all)
     # @mots = @user.mots.paginate(:page => params[:page])
     
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
