Spree.user_class.class_eval do
  has_one :referral
  has_one :referred_record
  
  attr_accessor :referral_code

  after_create :create_referral
  after_create :referral_check

  def referred_user
    referred_record.referral.user rescue nil
  end
  
  def referral_count
    referral.referred_records.count
  end

  def referred?
    !referred_record.referral.user.nil? rescue false
  end

  private
    def referral_check
      unless self.referral_code.nil?
        referral = Referral.find_by(:code => referral_code) rescue nil
        if referral
          referral.referred_records.create(:user => self)
        end
      end
    end
end
