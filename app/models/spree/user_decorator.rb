Spree.user_class.class_eval do
  has_one :referral, class_name: 'Spree::Referral'
  has_one :referred_record, class_name: 'Spree::ReferredRecord'
  has_one :affiliate, :through => :referred_record, :foreign_key => :affiliate_id, class_name: 'Spree::Affiliate'

  attr_accessor :referral_code, :affiliate_code

  after_create :create_referral
  after_create :referral_affiliate_check

  def referred_user
    referred_record.referral.user rescue nil
  end
  
  def referral_count
    referral.referred_records.count
  end

  def referred?
    !referred_record.referral.user.nil? rescue false
  end

  def affiliate?
    !affiliate.nil? rescue false
  end

  def referred_affiliate
    affiliate.name rescue nil
  end

  private
    def referral_affiliate_check
      if !self.referral_code.nil?
        referred = Spree::Referral.find_by(:code => referral_code) rescue nil
      elsif !self.affiliate_code.nil?
        referred = Spree::Affiliate.find_by(:path => affiliate_code) rescue nil
      end
      if referred
        referred.referred_records.create(:user => self)
      end
    end
end
