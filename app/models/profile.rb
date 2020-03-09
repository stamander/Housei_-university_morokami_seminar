class Profile < ApplicationRecord
  validates :name, presence: true
  validates :undergraduate, presence: true
  validates :subject, presence: true
  validates :gpa, presence: true
  validates :motivation, presence: true
  validates :pr, presence: true
  validates :life, presence: true
  validates :time, presence: true
  validates :task, presence: true



end
