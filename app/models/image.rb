class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :profile,dependent: :destroy


end
