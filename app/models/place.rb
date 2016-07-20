class Place < ActiveRecord::Base
  belongs_to :day
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images
end
