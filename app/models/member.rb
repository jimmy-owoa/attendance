class Member < ApplicationRecord
  belongs_to :church_annex
  belongs_to :user
  has_many :attendees
  has_many :events, through: :attendees

  def self.find_or_create_member user_id, church_annex_id
    member = Member.where(user_id: user_id, church_annex_id: church_annex_id).first_or_create
    member
  end
end
