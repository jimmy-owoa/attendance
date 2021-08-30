class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_type, :description, :offering, :date
  has_one :church_annex
end
