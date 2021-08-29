class ChurchAnnexSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :capacity, :enabled
  has_one :church
end
