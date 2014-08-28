module Spree
  class ReferralController < Spree::StoreController
    def referral
      session[:referral] = params[:code]
      redirect_to root_path
    end
    def affiliate
      session[:affiliate] = params[:path]
      affiliate = Spree::Affiliate.find_by(:path => params[:path]) rescue nil
      if affiliate.nil? or affiliate.partial.blank?
        redirect_to(root_path)
      else
        render_affiliate_partial affiliate.partial
      end
    end

    private
      def render_affiliate_partial partial
        begin
          render "spree/affiliates/#{partial}", layout: nil
        rescue ActionView::MissingTemplate => e
          flash[:error] = "Missing affiliate template."
          redirect_to(root_path)
        end
      end
  end
end
