class Donation < ActiveRecord::Base
  belongs_to :donor
  has_many :donation_claims
  has_many :charities, through: :donation_claims

  def accepted?
    donation_claims.where(accepted: true).count > 0
  end

end
