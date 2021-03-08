class Api::V1::MunchiesController < ApplicationController
  def index
      munchie = MunchiesFacade.get_json(params[:start], params[:destination], params[:food])

      render json: MunchiesSerializer.new(munchie)
  end
end