require 'rails_helper'

RSpec.describe DonationClaim, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to :charity }
    it { is_expected.to belong_to :donation }
  end

  describe 'Database schema' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :charity_id }
    it { is_expected.to have_db_column :donation_id }
    it { is_expected.to have_db_column :comment }
    it { is_expected.to have_db_column(:pick_up_date).of_type :date }
    it { is_expected.to have_db_column(:accepted).of_type :boolean}
    #Timestamps
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end
end
