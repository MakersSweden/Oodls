class Donor < ActiveRecord::Base
  ratyrate_rateable 'quality', 'reliability'
  has_many :donations
  has_many :donor_comments
  has_many :charities, through: :donor_comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates :firstname, :surname, presence: true
  geocoded_by :full_address
  after_validation :geocode
  has_attachment :logo

  def self.format_for_map
    Donor.all.map do |donor|
      {lat: donor.latitude,
       lon: donor.longitude,
       organisation: donor.organisation,
       description: donor.description,
       id: donor.id}
    end.to_json
  end

end
