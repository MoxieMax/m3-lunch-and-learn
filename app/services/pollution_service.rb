class PollutionService
  def self.get_air(lat, lng, key)
     response = conn.get("http://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=#{lat}&lon=#{lon}&appid=#{key}")
  end
  
  def self.conn
    Faraday.new('http://api.openweathermap.org/data/2.5')
  end
  
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  
end