class Donation < ActiveRecord::Base
  belongs_to :donor
  has_many :donation_claims
  has_many :charities, through: :donation_claims

end
