class Referral < ActiveRecord::Base
  belongs_to :user, class_name: Spree.user_class.to_s
  has_many :referred_records

  before_create :create_code

  def create_code
    self.code = (0...8).map { (65 + rand(26)).chr }.join
    self
  end

  def referred_users
    referred_records.includes(:user).map(&:user).compact
  end

  def referred_orders
    referred_records.includes(:user).map(&:user).map(&:orders).flatten.compact
  end
end
