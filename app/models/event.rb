class Event < ApplicationRecord
  belongs_to :church_annex
  has_many :attendees
  has_many :members, through: :attendees
end
