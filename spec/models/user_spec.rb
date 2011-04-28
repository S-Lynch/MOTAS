require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :name => "Test User", :email => "testemail@email.com", :password => "password", :password_confirmation => "password"}
  end

  it "should save this instance of the user" do
    User.create!(@attr)
  end

  it "should have a name based on model validation" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should have an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept a valid email address" do
    addresses = ['email@email.com', 'test@bcs.org.uk', 'name.surname@someting.org']
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should not accept duplicate email addresses" do
    User.create(@attr)
    user_with_duplicate_email = User.new = (@attr)
    user_with_duplicate_email.should_not be_valid
  end

describe "password validation" do


it "should require a password" do
  User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
end

  it "should require a matching password for confirmation" do
    User.new(@attr.merge(:password_condirmation => "notthesame")).should_not be_valid
  end

  it "should reject short passwords" do
    short = "a" * 4
    hash = @attr.merge(:password => short, :password_confimation => "short")
    User.new(hash).should_not be_valid
  end

  it "should reject long passwords" do
    long = "a" * 26
    hash2 = @attr.merge(:password => long, :password_confirmation => "long")
    User.new(hash2).should_not be_valid
  end
end
end
