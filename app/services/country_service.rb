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
    rando#[:name] #.downcase #might be necessary if all countries are downcased in the api

    # rando.dig(:name, :common) #.downcase #might be necessary if all countries are downcased in the api
  end
  
  def self.get_country(name)
    response = conn.get("https://restcountries.com/v3.1/name/#{name}")
    info = parse(response).first
    info
  end
end