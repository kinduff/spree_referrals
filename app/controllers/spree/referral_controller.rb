module Spree
  class ReferralController < Spree::StoreController
    def referral
      session[:referral] = params[:code]
      redirect_to root_path
    end
    def affiliate
      affiliate = Spree::Affiliate.find_by(:path => params[:path]) rescue nil
      if affiliate.nil?
        redirect_to(root_path)
      else
        session[:affiliate] = params[:path]
        render "spree/affiliates/#{affiliate.partial}", layout: nil
      end
    end
  end
end
