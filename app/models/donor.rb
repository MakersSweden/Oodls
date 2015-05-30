class Donor < ActiveRecord::Base
  ratyrate_rateable 'quality', 'reliability'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, :surname, presence: true
  has_attachment :logo
end
