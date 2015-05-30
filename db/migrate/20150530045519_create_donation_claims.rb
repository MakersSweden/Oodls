class CreateDonationClaims < ActiveRecord::Migration
  def change
    create_table :donation_claims do |t|
      t.references :charity, index: true, foreign_key: true
      t.references :donation, index: true, foreign_key: true
      t.text :comment
      t.date :pick_up_date
      t.boolean :accepted

      t.timestamps
    end
  end
end
