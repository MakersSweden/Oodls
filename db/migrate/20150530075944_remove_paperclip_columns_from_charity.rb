class RemovePaperclipColumnsFromCharity < ActiveRecord::Migration
  def change
    remove_column :charities, :logo_file_name, :string
    remove_column :charities, :logo_file_size, :integer
    remove_column :charities, :logo_content_type, :string
    remove_column :charities, :logo_updated_at, :datetime
  end
end
