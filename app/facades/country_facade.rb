class CountryFacade
  def self.random_country
    Country.new(CountryService.random_country)
  end
end