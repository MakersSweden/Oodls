class AddCityAndCountryToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :city, :string
    add_column :donors, :country, :string
    rename_column :donors, :full_address, :address
  end
end
