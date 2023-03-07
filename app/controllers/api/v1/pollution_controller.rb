class Api::V1::PollutionController < ApplicationController
  def index
    render json: PollutionSerializer.new()
  
end