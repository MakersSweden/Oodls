require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:charities).through :donation_claims }
    it { is_expected.to have_many :donation_claims}
    it { is_expected.to belong_to :donor }
  end

  describe 'Database schema' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :donor_id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column(:from_date).of_type(:date) }
    it { is_expected.to have_db_column(:will_deliver).of_type(:boolean) }
    #Timestamps
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end
end
