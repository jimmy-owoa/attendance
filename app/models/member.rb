class Member < ApplicationRecord
  belongs_to :church
  belongs_to :church_annex
end
