class CountryFacade
  def self.random_country
    Country.new(CountryService.random_country)
  end
  
  def self.search(country)
    Country.new(CountryService.get_country(name))
  end
end