class Api::V1::CountryController < ApplicationController
  def index
    render json: CountrySerializer.new(country)
  end
  
end