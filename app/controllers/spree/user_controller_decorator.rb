SetupController.class_eval do
  before_filter :check_referral, :only => :start_with_sign_up
  def check_referral
    params[:user].merge!(:referral_code => session[:referral])
  end
end
