class PollutionSerializer
  include JSONAPI::Serializer
  attributes :aqi, :datetime, :readable
  # binding.pry
end
