class Profile < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, presence: true
  validates :undergraduate, presence: true
  validates :subject, presence: true
  validates :gpa, presence: true
  validates :motivation, presence: true
  validates :pr, presence: true
  validates :life, presence: true
  validates :time, presence: true
  validates :task, presence: true
  validates :image, presence: true
  


end
