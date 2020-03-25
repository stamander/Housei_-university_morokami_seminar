class Image < ApplicationRecord
  mount_uploader :src,ImageUploader
  belongs_to :profile,optional: true

  validates :src, presence: true




end
