class CountryService
  def self.get_countries
    response = conn.get("/v3.1/all")
    parse(response)
  end
  
  def self.conn
    Faraday.new('https://restcountries.com')
  end
  
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.random_country
    rando = self.get_countries.sample
    rando.dig(:name, :common) #.downcase #might be necessary if all countries are downcased in the api
  end
  
  def self.country(name)
    response = conn.get("https://restcountries.com/v3.1/name/#{name}")
    info = parse(response)
    
    binding.pry
  end
  
  def self.capital_city_coord(country)
    info.first.dig(:capitalInfo, :latlng)
=> [43.73, 7.42]
    binding.pry
  end
  
end