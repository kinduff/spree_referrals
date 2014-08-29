config = Rails.application.config
config.after_initialize do
  config.spree.promotions.rules << Spree::ReferredPromotionRule
end
