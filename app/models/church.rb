class Church < ApplicationRecord
  has_many :church_annexes
  has_many :members
end
