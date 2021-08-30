class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :lastname, :phone, :legal_number, :enabled
  has_one :church
  has_one :church_annex
end
