class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :donor, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :will_deliver, default: false
      t.date :from_date

      t.timestamps
    end
  end
end
