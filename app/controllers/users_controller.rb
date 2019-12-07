class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :"users/signup"
        else 
            redirect "/"
        end 
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
        if !logged_in?
             erb :'/users/login'
        else
            redirect '/plants/index'
        end
    end

    post '/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect '/plants'
        else
          redirect '/login'
        end
      end

    get '/logout' do
      session.clear
      erb :'/homepage'
    end

end 