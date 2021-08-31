class AttendeeSerializer < ActiveModel::Serializer
  attributes :id, :temperature
  has_one :event
  has_one :member
end
