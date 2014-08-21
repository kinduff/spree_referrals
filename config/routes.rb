Spree::Core::Engine.routes.draw do
  get 'r/:code' => 'home#referral'
end
