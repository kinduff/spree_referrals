Spree.user_class.class_eval do
  has_one :referral
  has_one :referred_record, class_name: 'ReferralUser'
  
  attr_accessor :referral_code

  after_create :create_referral
  after_create :referral_check

  def referred_user
    referred_record.referral.user
  end
  
  def referral_count
    referral.referred_records.count
  end

  private
    def referral_check
      unless self.referral_code.nil?
        referral = Referral.find_by(:code => referral_code) rescue nil
        if referral
          referral.users.create(:user => self)
        end
      end
    end
end
