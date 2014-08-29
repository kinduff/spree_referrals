class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.string :name
      t.string :path
      t.string :partial
      t.timestamps
    end
  end
end
