class DonationClaim < ActiveRecord::Base
  belongs_to :donation
  belongs_to :charity

  validates_presence_of :donation, :charity, :comment, :pick_up_date
end
