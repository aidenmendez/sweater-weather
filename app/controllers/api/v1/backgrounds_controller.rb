class Api::V1::BackgroundsController < ApplicationController
  def index
    begin
      image = BackgroundsFacade.get_image(params[:location])
      render json: ImageSerializer.new(image)
    rescue
      render json: {"error" => {"message" => "Something went wrong"}}, status:400
    end
  end
end