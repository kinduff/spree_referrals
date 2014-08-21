module Spree
  HomeController.class_eval do
    def referral
      session[:referral] = params[:code]
      redirect_to root_path
    end
  end
end
