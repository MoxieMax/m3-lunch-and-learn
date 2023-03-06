class CountrySerializer
  def self.country_information(country)
    {
      "data": country.map do |country|
        {
          binding.pry
          "common": country[:common]
        }
    }
  end
  
end