class MotsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
#  attr_accessor

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
     @mots = Mot.find(:all)
    Mot.joins(:users).where('mots.mot_date is not null')
  # User.joins(:mots).where('users.mot_date')
  #Mot.joins(:mots)
    # @users.User.find(:all, :conditions => "...", :include => :mot)
    #  @users = User.joins(:mot).where(:mot => {:mot_date => true})
   # @users = User.joins(:mot).where('mots.mot_date is not null')
# @users = User.find(:all, :include => :mot_date)
    @date = params[:month] ? Date.parse(params[:month].gsub('-', '/')) : Date.today
    #  @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

  def destroy
   @mot.destroy(params[:id])
   redirect_to current_user
  end

  private

  def authorized_user
    @mot = Mot.find(params[:id])
    redirect_to root_path unless current_user?(@mot.user)
  end

end
