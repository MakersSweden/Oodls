class DonationClaim < ActiveRecord::Base
  belongs_to :donation
  belongs_to :charity
end
