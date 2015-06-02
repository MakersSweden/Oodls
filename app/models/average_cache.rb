class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Charity"
  belongs_to :rateable, :polymorphic => true
end
