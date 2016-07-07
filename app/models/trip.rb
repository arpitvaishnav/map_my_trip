class Trip < ActiveRecord::Base
  has_one :image, as: :imageable, dependent: :destroy
  has_many :travel_cities
  accepts_nested_attributes_for :image
end

