class Event < ApplicationRecord
  belongs_to :organization
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  validates :organization, presence: true

  validates :date, presence: true
  validates :time, presence: true
  validates :event_name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  def to_s
    event_name
  end

  def address
    [street_address, city, state, zip_code].compact.join(', ')
  end

  def address_changed?
    street_address_changed? || city_changed? || state_changed? || zip_code_changed?
  end
  
end
