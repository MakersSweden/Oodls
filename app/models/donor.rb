class Donor < ActiveRecord::Base
  ratyrate_rateable 'quality', 'reliability'
  has_many :donations
  has_many :donor_comments
  has_many :charities, through: :donor_comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates :firstname, :surname, presence: true
  geocoded_by :full_address
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.address = geo.street_address unless obj.address?
      obj.city = geo.city unless obj.city?
      obj.postcode = geo.postal_code unless obj.postcode?
      obj.country = geo.country
    end
  end
  after_validation :geocode, :reverse_geocode

  has_attachment :logo

  def full_address
    [address, city, postcode].compact.join(', ')
  end

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
