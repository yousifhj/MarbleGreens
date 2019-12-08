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

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect '/plants'
        else
          redirect '/login'
        end
      end

    get "/logout" do
      if logged_in?
        session.clear
        redirect to "/welcome"
      else
        redirect to "/welcome"
      end
    end

end 