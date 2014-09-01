require 'spec_helper'

describe Spree::AffiliatedPromotionRule, :type => :model do
  before(:each) do
    @rule = Spree::AffiliatedPromotionRule.new
    @user = FactoryGirl.create(:user, email: Faker::Internet.email)
    @affiliate = Spree::Affiliate.create(name: Faker::Name.name, path: Faker::Name.name)
    @affiliated = FactoryGirl.create(:user, email:  Faker::Internet.email, affiliate_code: @affiliate.path)
    @organic_order = FactoryGirl.create(:order, :user => @user)
    @affiliated_order = FactoryGirl.create(:order, :user => @affiliated)
  end
  it "is applicable for an order" do
    expect(@rule.applicable?(@affiliated_order)).to be_truthy
  end
  it "is elegible for affiliated user" do
    expect(@rule.eligible?(@affiliated_order)).to be_truthy
  end
  it "is not elegible for organic user" do
    expect(@rule.eligible?(@organic_order)).to be_falsy
  end
end
