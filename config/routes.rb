Spree::Core::Engine.routes.draw do
  get 'r/:code' => 'home#referral', as: 'referral'
end
