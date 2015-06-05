class AddCityAndVerifiedToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :city, :string
    add_column :charities, :verified, :boolean
    add_column :charities, :country, :string
    rename_column :charities, :full_address, :address
  end
end
