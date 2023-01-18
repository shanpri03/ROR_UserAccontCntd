class BkstckmanageController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index 
        auth_user = Loginusr.find_by_id(session[:current_user_id])
        if !auth_user.nil? 
            render json: Bookstck.all 
        else
           render html: "You are an unauthorised user! Please login to continue" 
        end 
    end

def show
    current_user = Loginusr.find_by_id(session[:current_user_id])
    if !current_user.nil?
    bol = Bookstck.exists?(params[:id])
    if bol
    y = Bookstck.find(params[:id])
    render json: y
    else
    render json: "Book not found"
    end
    else
    render json: "Please login to continue."
    end
   
end

 def create
    current_user = Loginusr.find_by_id(session[:current_user_id])
    if !current_user.nil?
        v = !params[:bookname] and !params[:bookauthor] and !params[:bookquantity] and !params[:bookprice] and !params[:pubyear]
        puts params[:bookname]
        if !v
        b = Bookstck.create('bookname': params[:bookname],'bookauthor': params[:bookauthor],'bookquantity': params[:bookquantity], 'bookprice': params[:bookprice], 'pubyear': params[:pubyear])
        render json: "Book created successfully"
        else 
        render json: "Book not created. Try again"
        end
    else
        render json: "Please login to continue."
    end   
      end
 
      def update
        current_user = Loginusr.find_by_id(session[:current_user_id])
       if !current_user.nil?
          b = Bookstck.all
    a = Bookstck.exists?(params[:id])
    if a
        b = Bookstck.find_by_id(params[:id])
        b.update('bookname': params[:bookname], 'bookauthor': params[:bookauthor], 'bookquantity': params[:bookquantity],'bookprice': params[:bookprice], 'pubyear': params[:pubyear])
        render json: "Book data Updated."
    else
        render json: "Book not found."
    end
else
    render json: "Please login to continue."
end
        
end

    def destroy
        current_user = User.find_by_id(session[:current_user_id])
    if !current_user.nil?
        a = Bookstck.exists?(params[:id])

        if a
             b = Bookstck.find_by_id(params[:id])
             b.destroy
            render json: "Book deleted successfully."
        else
            render json: "Book not found."
        end

    else
        render json: "Please login to continue."
    end

    end

 end

