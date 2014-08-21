Spree::UserRegistrationsController.class_eval do
  before_filter :check_referral, :only => :create
  def check_referral
    params[:spree_user].merge!(:referral_code => session[:referral])
  end
end
