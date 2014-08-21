class ReferralUser < ActiveRecord::Base
  belongs_to :referral
  belongs_to :user, class_name: Spree.user_class
end
