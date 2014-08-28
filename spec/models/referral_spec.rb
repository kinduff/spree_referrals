require 'spec_helper'

describe Spree::Referral, :type => :model do
  it "generates a code" do
    referral = Spree::Referral.new().create_code
    expect(referral.code).to_not be_nil
  end

  it "generates a code after created" do
    referral = Spree::Referral.new()
    expect{referral.save}.to change{referral.code}
  end

  it "returns a code" do
    referral = Spree::Referral.create()
    expect(referral.code).to_not be_nil
  end

  context "with user" do
    before(:each) do
      @user = FactoryGirl.create(:user, email: Faker::Internet.email)
      @referred = FactoryGirl.create(:user, email: Faker::Internet.email, referral_code: @user.referral.code)
      @order = FactoryGirl.create(:order, :user => @referred)
    end

    it "returns an associated user record" do
      expect(@user.referral.user).to_not be_nil
    end
    it "returns referred records" do
      expect(@user.referral.referred_records.count).to eq(1)
    end
    it "returns an array of referred users" do
      expect(@user.referral.referred_users).to eq([@referred])
    end
    it "returns an array of referred orders" do
      expect(@user.referral.referred_orders).to eq([@order])
    end
  end
end
