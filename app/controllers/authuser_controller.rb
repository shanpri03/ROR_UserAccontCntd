require 'bcrypt'
class AuthuserController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        render json: Loginusr.all
    end
    def show
  
    h = Loginusr.find(params[:id])
    render json: h
    
    end

    def create
        
        v = !params[:name].empty? and !params[:email].empty? and params[:password].empty?
        if v 
            d = Loginusr.create(
                'name': params[:name],
                'email': params[:email],
                'password': params[:password]
            )
            puts d 
            render json: "Data Added Successfully"
        else 
            render json: "Data not added"
        end
    end
    def destroy
        a = Loginusr.find(params[:id].to_i)
        a.destroy
        render json: "Data deleted"
    end
end
