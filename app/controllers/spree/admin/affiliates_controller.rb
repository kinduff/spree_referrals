module Spree
  class Admin::AffiliatesController < Admin::BaseController
    def index
      @affiliates = Affiliate.all
    end
  end
end
