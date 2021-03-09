class Api::V1::SessionsController < ApplicationController
  def create
    # begin
      user = User.find_by(email: params[:email])

      if user && user.authenticate(params[:password])
        render json: UserSerializer.new(user), status: 200
      else
        render json: {"error" => {"message" => "Incorrect credentials"}}, status:400
      end
    # rescue
    #   render json: {"error" => {"message" => "Something went wrong"}}, status:400
    # end
  end
end