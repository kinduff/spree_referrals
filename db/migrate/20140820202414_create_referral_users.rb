class CreateReferralUsers < ActiveRecord::Migration
  def change
    create_table :referral_users do |t|
      t.integer :user_id
      t.integer :referral_id

      t.timestamps
    end
  end
end
