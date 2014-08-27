require 'spec_helper'

describe Spree::HomeController do
  context "referred hyperlink" do
    it "redirects to root path" do
      spree_get :referral
      expect(response).to redirect_to('/')
    end
    it "creates session variable with referral code" do
      code = 'referral-code'
      spree_get :referral, :code => code
      expect(session[:referral]).to eq(code)
    end
  end
end
