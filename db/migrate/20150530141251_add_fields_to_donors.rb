class AddFieldsToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :organisation, :string
    add_column :donors, :description, :string
    add_column :donors, :postcode, :string
    add_column :donors, :full_address, :string
    add_column :donors, :website_url, :string
    add_column :donors, :contact_name, :string
  end
end
