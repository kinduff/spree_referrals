SetupController.class_eval do
  before_filter :check_referral_and_affiliate, :only => :start_with_sign_up
  def check_referral_and_affiliate
    params[:spree_user].merge!(:referral_code => session[:referral], :affiliate_code => session[:affiliate])
  end
end
