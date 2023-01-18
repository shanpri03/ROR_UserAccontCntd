require 'bcrypt'
class BloginuserController < ApplicationController

    skip_before_action :verify_authenticity_token
def index
    current_user = Loginusr.find_by_id(session[:current_user_id])
    render json: current_user
end

  def create
    a = Loginusr.find_by('email': params[:email])
    if a.nil?
        render json:"Account not exists."
    else 
        if a.authenticate(params[:password])
            session[:current_user_id] = a.id
            render json: "Logged in successfully."
        else
            render json: "Unable to login."
        end
  end
end

def destroy
    session.delete(:current_user_id)
    render json: "Logged out successfully."
end


end
