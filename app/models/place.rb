class Place < ApplicationRecord
  mount_uploader :image, PlaceImageUploader

  has_many :posts
  belongs_to :country

end
