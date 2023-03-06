require 'rails_helper'

RSpec.describe 'Country Service' do
  it 'returns data from API' do
    json_response = File.read("spec/fixtures/country_service/europe_fixture.json")
    stub_request(:get, "https://restcountries.com/v3.1/all").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: json_response, headers: {})
    
    
    country = CountryService.random_country
    
    expect(country).to be_a(String)
    expect(country).to_not be_a(Hash)
  end
  
  it 'can return coordinates for a capital city' do
    json_response = File.read("spec/fixtures/country_service/monaco_fixture.json")
    stub_request(:get, "https://restcountries.com/v3.1/name/Monaco").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: json_response, headers: {})
         
    country = CountryService.country("Monaco").first
    
    binding.pry
    
    expect(country[:name]).to eq("Monaco")
    expect(country[:capitalInfo]).to eq()
  end
end

