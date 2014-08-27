require 'spec_helper'

describe Spree::UserRegistrationsController do
  before { @request.env['devise.mapping'] = Devise.mappings[:spree_user] }

  context "#create" do
    it "should add referral_code param" do
      code = 'referral-code'
      session[:referral] = code
      spree_post :create, { spree_user: { email: 'foobar@example.com', password: 'foobar123', password_confirmation: 'foobar123' } }
      controller.params[:spree_user][:referral_code].should eql(code)
    end
  end
end
