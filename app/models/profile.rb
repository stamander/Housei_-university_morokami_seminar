class Profile < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, presence: true
  validates :kana, presence: true
  validates :phone_number,presence: true
  validates :mail, presence: true
  validates :number, presence: true
  validates :undergraduate, presence: true
  validates :subject, presence: true
  validates :gpa, presence: true
  validates :motivation, presence: true
  validates :pr, presence: true
  validates :life, presence: true
  validates :time, presence: true
  validates :task, presence: true
  validates :images, presence: true
  validates :time1, presence: true

  


end
