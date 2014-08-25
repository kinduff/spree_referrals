require 'spec_helper'

describe Spree::User, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user, email: Faker::Internet.email)
    @referred = FactoryGirl.create(:user, email:  Faker::Internet.email, referral_code: @user.referral.code)
  end
  context "referral user" do
    it "has a referral record" do
      expect(@user.referral).not_to be_nil
    end
    it "has a referral code" do
      expect(@user.referral.code).not_to be_nil
    end
    it "has a referral count" do
      expect(@user.referral_count).to eq(1)
    end
    it "has referred users" do
      expect(@user.referral.referred_users).to eq([@referred])
    end
    it "has referred records" do
      expect(@user.referral.referred_records).to eq([@referred.referred_record])
    end
  end

  context "referred user" do
    it "has a referred user" do
      expect(@referred.referred_user).to eq(@user)
    end
    it "has a referred record" do
      expect(@referred.referred_record).to eq(@user.referral.referred_records.first)
    end
  end
end
