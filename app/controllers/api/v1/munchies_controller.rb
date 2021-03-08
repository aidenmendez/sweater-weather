class Api::V1::MunchiesController < ApplicationController
  def index
    munchies = MunchiesFacade.new(params[:start], params[:destination], params[:food])
  end
end