Spree.user_class.class_eval do
  has_one :referral
  has_one :referred, class_name: 'ReferralUser'
  
  attr_accessor :referral_code

  before_create :create_referral
  after_create :referral_check

  private
    def create_referral
      build_referral
      true
    end
    def referral_check
      unless self.referral_code.nil?
        referral = Referral.find_by(:code => referral_code) rescue nil
        if referral
          referral.users.create(:user => self)
        end
      end
    end
end
