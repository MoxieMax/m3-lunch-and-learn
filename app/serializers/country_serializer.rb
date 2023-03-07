class CountrySerializer
  include JSONAPI::Serializer
  attributes :name, :common, :capital, :capitalInfo, :latlng
  
end