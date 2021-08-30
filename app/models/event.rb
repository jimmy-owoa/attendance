class Event < ApplicationRecord
  belongs_to :church_annex
  has_many :assistants
  has_many :members, through: :assistants
end
