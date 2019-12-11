class UsersController < ApplicationController

    get '/signup' do
            erb :"users/signup"
    end 
 
    post "/signup" do
        if params[:username] == "" || params[:password] == "" || params[:email] == ""
            redirect to "/signup"
        else 
            user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
            # binding.pry
            session[:user_id] = user.id
            if logged_in?
                redirect "/plants"
            else
                redirect to "/signup"
            end
        end
    end

end 