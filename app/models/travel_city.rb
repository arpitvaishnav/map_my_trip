class TravelCity < ActiveRecord::Base
  belongs_to :trip
  has_many :days
end
