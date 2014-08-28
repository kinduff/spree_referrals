class Affiliate < ActiveRecord::Base
  has_many :referred_records
end
