class DonorComment < ActiveRecord::Base
  belongs_to :donor
  belongs_to :charity

  validates_presence_of :body
end
