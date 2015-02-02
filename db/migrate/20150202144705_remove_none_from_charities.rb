class RemoveNoneFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :none, :string
  end
end
