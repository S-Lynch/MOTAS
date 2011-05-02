class UsersController < ApplicationController
  # Limits the methods below to the ones contained in the only hash unless the private method returns true
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def index
    @title = "All MOTAS Users"
    @users = User.paginate(:page => params[:page]) #paginate used to show the list of users across different pages
  end

  def show
    @user = User.find(params[:id]) # gets all of the attributes associated with the User with the desired ID.
    @mots = @user.mots.paginate(:page => params[:page])
    @title = @user.name
  end

  def new
    @user = User.new #user object stored in instance variable to be used in the corresponding View
    @title = "Sign Up"
  end

  #the method to store the information saved from the view 
  def create
    @user = User.new(params[:user]) #params from the database table users but in Rails it has the singular and plural naming conventions
     if @user.save
      # add the mailer method
      #The MotReminder mailer.mot_reminder method and view with the user object
       (UserMailer.registration_confirmation(@user)).deliver
       sign_in @user
       flash[:notice] = fading_flash_message("You Have Successfully Signed up to MOTAS, Please book your M.O.T", 5)
       redirect_to @user
     else
        @title = "Sign Me Up"
        @user.email = nil
        @user.password = nil
        @user.password_confirmation = nil
        render 'new'
      end
    end

    def edit
      @title = "Edit User"
    end

    def update
    #  @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:success] = "Updated your account"
        redirect_to @user
      else
        @title = "Edit User"
        render 'edit'
      end

      def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User Deleted"
        redirect_to users_path
      end

    end

    private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end


end
