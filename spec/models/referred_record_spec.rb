require 'spec_helper'

describe ReferredRecord, :type => :model do
  before(:each) do
    @user = FactoryGirl.create(:user, email: Faker::Internet.email)
    @referred = FactoryGirl.create(:user, email:  Faker::Internet.email, referral_code: @user.referral.code)
    @referral_record = @referred.referred_record
  end

  it "returns has a user id" do
    expect(@referral_record.user_id).not_to be_nil
  end

  it "returns an associated user record" do
    expect(@referral_record.user).not_to be_nil
  end

  it "returns has a referral id" do
    expect(@referral_record.referral_id).not_to be_nil
  end

  it "returns an associated referral record" do
    expect(@referral_record.referral).not_to be_nil
  end
end
