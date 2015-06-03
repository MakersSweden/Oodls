class AddLatAndLanToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :latitude, :float
    add_column :donors, :longitude, :float
  end
end
