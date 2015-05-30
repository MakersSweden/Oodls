class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Donor"
  belongs_to :rateable, :polymorphic => true
end
