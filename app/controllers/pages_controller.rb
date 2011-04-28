class PagesController < ApplicationController
  
  def home
    @title = "Home"
      if signed_in?
      @mot = Mot.new
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end
end
