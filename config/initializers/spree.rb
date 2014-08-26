Spree::PermittedAttributes.user_attributes.push :referral_code
config = Rails.application.config
config.after_initialize do
  config.spree.promotions.rules << ReferredPromotionRule
end
