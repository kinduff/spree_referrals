class ReferralUser < ActiveRecord::Base
  belongs_to :referral
  belongs_to :user
end
