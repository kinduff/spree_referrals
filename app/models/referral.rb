class Referral < ActiveRecord::Base
  belongs_to :user
  has_many :users, class_name: 'ReferralUser'

  before_create :create_code

  def create_code
    self.code = (0...8).map { (65 + rand(26)).chr }.join
  end
end
