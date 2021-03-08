class Api::V1::MunchiesController < ApplicationController
  def index
    # call MapQuest Directions service
      # returns travel time and destination city
    # Pass arrival time and type of cuisine to Yelp service
      # Returns a restaurant that'll be open serving specified cuisine
    # Pass destination parameter to Forecast API

    munchies = MunchiesFacade.new(params[:start], params[:destination], params[:food])
    # serialize munchies
  end
end