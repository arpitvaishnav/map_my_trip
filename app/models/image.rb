class Image < ActiveRecord::Base
  dragonfly_accessor :image
  belongs_to :imageable, polymorphic: true
end
