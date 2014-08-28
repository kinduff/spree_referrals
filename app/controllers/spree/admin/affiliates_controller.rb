module Spree
  module Admin
    class AffiliatesController < Spree::Admin::ResourceController
      def index
        @affiliates = Affiliate.all.page(params[:page]).per(Spree::Config[:admin_products_per_page])
      end
    end
  end
end
