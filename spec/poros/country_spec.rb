require 'rails_helper'

RSpec.describe 'Country' do
  it 'exists and has attributes' do
    json_response = File.read("spec/fixtures/country_service/europe_fixture.json")
    stub_request(:get, "https://restcountries.com/v3.1/all").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: json_response, headers: {})
    
    country = CountryFacade.random_country
    
    expect(country).to be_a(Country)
    expect(country.name).to be_a(String)
  end
  
  it 'can return coordinates for a capital city' do
    json_response = File.read("spec/fixtures/country_service/monaco_fixture.json")
    stub_request(:get, "https://restcountries.com/v3.1/name/CountryFacade").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: json_response, headers: {})
         
    country = CountryFacade.search("Monaco")
    
    expect(country.name).to eq("Monaco")
    expect(country.coords).to eq([43.73333333, 7.4])
    expect(country.lat).to eq(43.73333333)
    expect(country.lng).to eq(7.4)
  end
end