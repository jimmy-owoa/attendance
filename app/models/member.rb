class Member < ApplicationRecord
  belongs_to :church
  belongs_to :church_annex
  has_many :assistants
  has_many :events, through: :assistants
end
