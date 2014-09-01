require 'spec_helper'

describe Spree::Affiliate do
  it "should have a name" do
    record = Spree::Affiliate.new(name: nil)
    record.valid?
    expect(record.errors[:name].size).to eq(1)
  end
  it "should have a path" do
    record = Spree::Affiliate.new(path: nil)
    record.valid?
    expect(record.errors[:path].size).to eq(1)
  end

  context "with user" do
    before(:each) do
      @affiliate = Spree::Affiliate.create(name: Faker::Name.name, path: Faker::Name.name)
      @affiliated = FactoryGirl.create(:user, email:  Faker::Internet.email, affiliate_code: @affiliate.path)
      @order = FactoryGirl.create(:order, :user => @affiliated)
    end

    it "returns an array of user records" do
      expect(@affiliate.referred_users).to eq([@affiliated])
    end
    it "returns an array of referred orders" do
      expect(@affiliate.referred_orders).to eq([@order])
    end
    it "returns referred count" do
      expect(@affiliate.referred_count).to eq(1)
    end
    it "returns an array of referred orders" do
      expect(@affiliate.referred_records).to eq([@affiliated.affiliate_record])
    end
  end
end
