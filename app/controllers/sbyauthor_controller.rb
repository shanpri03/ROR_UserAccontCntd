class SbyauthorController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        current_user = Loginusr.find_by_id(session[:current_user_id])
        if !current_user.nil?
        bauthor = Bookstck.where('bookauthor': params[:bookauthor])
        if (bauthor.nil?)
            render json: "Book by this author is not available"
        else 
            render json: bauthor
        end
        else
        render json: "Please login to continue."
        end
    end
end