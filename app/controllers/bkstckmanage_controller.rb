class BkstckmanageController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index 
        auth_user = Bookstck.find_by_id(session[:current_login])
        if !auth_user.nil? 
            render json: Bookstck.all 
        else
           render html: "You are not an authorised user to view books!" 
        end 
    end

def show
    a = Bookstck.find(params[:id])
    render json: a
   
end

 def create
    v=!params[:bookname].empty?
    if(v)
     Bookstck.create('bookname': params[:bookname], 'bookauthor': params[:bookauthor], 'bookquantity': params[:bookquantity],'bookprice': params[:bookprice], 'pubyear': params[:pubyear])
     puts p
     render json: "Book created successfully"
    else
     render json: "Book not added"
      end
 
      def update
        b = Bookstck.find(params[:id].to_i)
        b.update('bookname': params[:bookname], 'bookauthor': params[:bookauthor], 'bookquantity': params[:bookquantity],'bookprice': params[:bookprice], 'pubyear': params[:pubyear])
        render json: "Book data Updated"
    end

    def destroy
        a = Bookstck.find(params[:id].to_i)
        a.destroy
        render json: "Book deleted successfully"
    end

 end
end
