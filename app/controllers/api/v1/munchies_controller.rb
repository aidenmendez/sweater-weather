class Api::V1::MunchiesController < ApplicationController
  def index
    # begin
      MunchiesFacade.get_json(params[:start], params[:destination], params[:food])
    # rescue
    #   render json: {"error" => {"message" => "Something went wrong"}}, status:400
    # end
  end
end