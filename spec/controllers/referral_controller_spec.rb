require 'spec_helper'

describe Spree::ReferralController do
  context "referred hyperlink" do
    it "redirects to root path" do
      spree_get :referral
      expect(response).to redirect_to('/')
    end
    it "creates session variable with referral code" do
      code = 'referral-code'
      spree_get :referral, code: code
      expect(session[:referral]).to eq(code)
    end
  end
  context "affiliate hyperlink" do
    it "creates session variable with affiliate path" do
      path = 'affiliate'
      spree_get :affiliate, :path => path
      expect(session[:affiliate]).to eq(path)
    end
    it "redirects to root path if path params is nil" do
      spree_get :affiliate
      expect(response).to redirect_to('/')
    end
    it "redirects to root path if affiliate has no partial" do
      @affiliate = Spree::Affiliate.create(name: Faker::Name.name, path: Faker::Name.name)
      spree_get :affiliate, path: @affiliate.path
      expect(response).to redirect_to('/')
    end
    it "redirects to root path if affiliate partial is not found" do
      @affiliate = Spree::Affiliate.create(name: Faker::Name.name, path: Faker::Name.name, partial: Faker::Name.name)
      spree_get :affiliate, path: @affiliate.path
      expect(response).to redirect_to('/')
    end
    it "renders a partial if affiliate partial is found" do
      name = 'corona'
      @affiliate = Spree::Affiliate.create(name: name, path: name, partial: name)
      controller.stub(:partial_exists).and_return(true)
      expect {
        spree_get :affiliate, path: @affiliate.path
      }.to raise_error(ActionView::MissingTemplate) # no fake template
    end
  end
end
