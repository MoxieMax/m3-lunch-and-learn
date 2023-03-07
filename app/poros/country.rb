class Country
  
  attr_reader :name,
              :coords,
              :lat,
              :lng
  
  def initialize(data)
    @name = data.dig(:name, :common)
    @coords = data[:latlng]
    @lat = data[:latlng].first
    @lng = data[:latlng].last
  end
end


# @capital = data[:capital].first
# @cap_coord = data.dig(:capitalInfo, :latlng)
# @cap_lat = data.dig(:capitalInfo, :latlng).first
# @cap_lng = data.dig(:capitalInfo, :latlng).last
