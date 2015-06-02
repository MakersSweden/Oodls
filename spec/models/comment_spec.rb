require 'rails_helper'

RSpec.describe DonorComment, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to :charity }
    it { is_expected.to belong_to :donor }
  end

  describe 'Database schema' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :charity_id }

    #Timestamps
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :body }
  end
end
