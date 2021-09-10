class ChurchAnnex < ApplicationRecord
  belongs_to :church
  has_many :events
  has_many :members

  def self.add_member user_params, church_annex
    user = User.find_or_create_user user_params
    member = Member.find_or_create_member user.id, church_annex.id
    member
  end
end
