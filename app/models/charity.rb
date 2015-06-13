class Charity < ActiveRecord::Base
  ratyrate_rater
  has_many :donation_claims
  has_many :donor_comments
  has_many :donors, through: :donations
  has_many :donations, through: :donation_claims


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :organisation, :postcode, :address

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
  before_save :verify_charity

  has_attachment :logo

  scope :cereals, -> value { where(cereals: value) }
  scope :coffee_and_tea, -> value { where(coffee_and_tea: value) }
  scope :cooking_ingredients, -> value { where(cooking_ingredients: value) }
  scope :dried_goods, -> value { where(dried_goods: value) }
  scope :drinks, -> value { where(drinks: value) }
  scope :fresh_fruit_and_veg, -> value { where(fresh_fruit_and_veg: value) }
  scope :jars_and_condiments, -> value { where(jars_and_condiments: value) }
  scope :fresh_meat_and_fish, -> value { where(fresh_meat_and_fish: value) }
  scope :snacks, -> value { where(snacks: value) }
  scope :tins, -> value { where(tins: value) }
  scope :uht_milk, -> value { where(uht_milk: value) }

  def full_address
    [address, city, postcode].compact.join(', ')
  end

  def requirements_array
    @food_reqs = %w(tins dried_goods coffee_and_tea fresh_fruit_and_veg snacks jars_and_condiments cereals cooking_ingredients drinks uht_milk fresh_meat_and_fish)

    @food_reqs.inject([]) do |memo, col|
      if (self[col] == "1")
        memo << { :label => col.humanize, :heading => col }
      end
      memo
    end
  end

  def verify_charity
    if city == "Göteborg" or city == "Gothenburg"
      verified_charity = Scrapers::GoteborgCharities.search(organisation).present?
      self.verified = verified_charity
    end
  end

  def self.format_for_map
    Charity.all.map do |charity|
      {
        :lat => charity.latitude,
        :lon => charity.longitude,
        :organisation => charity.organisation,
        :requirements => charity.requirements_array,
        :weekday_hours => charity.weekday_opening_hours,
        :weekend_hours => charity.weekend_opening_hours,
        :id => charity.id
      }
    end.to_json
  end

  def self.search(query)
    where("lower(organisation) like ?", "%#{query.downcase}%")
    # where("soundex(organisation) like soundex(?)", "%#{query.downcase}%")
  end

end
