class FixTableNames < ActiveRecord::Migration
  def change
    rename_table :referrals, :spree_referrals
    rename_table :referred_records, :spree_referred_records
    rename_table :affiliates, :spree_affiliates
  end
end
