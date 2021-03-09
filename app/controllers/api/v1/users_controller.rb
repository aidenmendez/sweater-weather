class Api::V1::UsersController < ApplicationController
  def create
    #add sad path conditions later
    begin
      if User.find_by(email: params[:email])
        render json: {"error" => {"message" => "Email already taken"}}, status:400
      elsif params[:password] != params[:password_confirmation]
        render json: {"error" => {"message" => "Passwords don't match"}}, status:400
      else
        params[:user] = {
                          :email                  => params[:email], 
                          :password               =>  params[:password],
                          :confirmation_password  => params[:confirmation_password]
                        }
    
        user = User.create!(user_params)
        render json: UserSerializer.new(user), status: 201
      end
    rescue
      render json: {"error" => {"message" => "Something went wrong"}}, status:400
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end