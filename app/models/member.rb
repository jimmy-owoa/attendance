class Member < ApplicationRecord
  belongs_to :church_annex
  belongs_to :user
  has_many :attendees
  has_many :events, through: :attendees
end
