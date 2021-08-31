class Member < ApplicationRecord
  belongs_to :church
  belongs_to :church_annex
  has_many :attendees
  has_many :events, through: :attendees
end
