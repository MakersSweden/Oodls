class CreateDonorComments < ActiveRecord::Migration
  def change
    create_table :donor_comments do |t|
      t.references :charity, index: true, foreign_key: true
      t.references :donor, index: true, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
