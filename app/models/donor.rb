class Donor < ActiveRecord::Base

  has_many :donations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  # validates_presence_of :firstname
  # validates_presence_of :surname
  # validates_presence_of :primary_postcode

end
