class LunchSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :starts_on, :ends_on
end
