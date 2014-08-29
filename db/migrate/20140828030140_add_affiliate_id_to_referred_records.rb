class AddAffiliateIdToReferredRecords < ActiveRecord::Migration
  def change
    add_column :referred_records, :affiliate_id, :integer
  end
end
