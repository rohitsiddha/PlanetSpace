require 'spec_helper'

describe UsersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

end