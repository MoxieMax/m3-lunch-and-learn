class Country
  
  attr_reader :name,
              :capital,
              :cap_coord,
              :cap_lat,
              :cap_lng
  
  def initialize(data)
    @name = data.dig(:name, :common)
    @capital = data[:capital].first
    @cap_coord = data.dig(:capitalInfo, :latlng)
    @cap_lat = data.dig(:capitalInfo, :latlng).first
    @cap_lng = data.dig(:capitalInfo, :latlng).last
  end
  
  # def initialize(data)
  #   @name = data[:name]
  # end
end

