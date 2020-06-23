class Post < ApplicationRecord
  mount_uploader :image_1, PostImageUploader
  mount_uploader :image_2, PostImageUploader
  mount_uploader :image_3, PostImageUploader
  belongs_to :place
end
