require 'spec_helper'

describe UsersController do
  render_views # tells Rails to test the views that follow the controller action e.g. new.html.erb
#tests that the page can be delivered to the user via the browser
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  # Tests that the newly created page has the correct title
  it "the sign up page should have the correct title" do
    get 'new'
    response. should have_selector("title", :content => "Sign Up")
  end

end
