require 'rails_helper'

RSpec.describe Donor do

  describe 'Associations' do
    it { is_expected.to have_many(:charities).through :donations }
    it { is_expected.to have_many(:donations) }
    it { is_expected.to have_many :donor_comments }
  end

  describe 'Database schema' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :organisation }
    it { is_expected.to have_db_column :contact_name }
    it { is_expected.to have_db_column :website_url }
    it { is_expected.to have_db_column :description }
    #Timestamps
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end


end

