class Donor < ActiveRecord::Base
  ratyrate_rateable 'quality', 'reliability'
  has_many :donations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates :firstname, :surname, presence: true
  has_attachment :logo
end
