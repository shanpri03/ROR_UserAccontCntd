class SbynameController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        current_user = Loginusr.find_by_id(session[:current_user_id])
        if !current_user.nil?
        bname = Bookstck.where('bookname': params[:bookname])
        if (bname.nil?)
            render json: "This book is not available"
        else 
            render json: bname
        end
        else
        render json: "Please login to continue."
        end
    end
end
