require 'spec_helper'


describe PagesController do

  render_views #tells RSpec to render the views for the actions below so they can be tested and that there is actually a page there.

  describe "GET 'home'" do # is a description of what this test scenario should do, for example respond to a HTTP GET request
    it "should be successful" do #code in " " is not relevent for RSpec however is used for human readability
      get 'home'
      response.should be_success #in RSpec means a response should return the code 200 which is a successful response. 
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'about page'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end
end
