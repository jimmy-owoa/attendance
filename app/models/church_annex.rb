class ChurchAnnex < ApplicationRecord
  belongs_to :church
  has_many :events
  has_many :members
end
