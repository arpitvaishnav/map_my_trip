class Day < ActiveRecord::Base
  belongs_to :travel_city
  has_many :places
end
