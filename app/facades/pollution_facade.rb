class PollutionFacade
  def self.search(lat, lng, api)
    Pollution.new(PollutionService).get_air(lat, lng, key)
  end
end