class UsersController < ApplicationController

    get '/login' do 
        erb :'/users/login'
    end 

    
    get '/signup' do
        if !logged_in?
            erb :"users/signup"
        else 
            redirect "/users/create_user"
        end 
    end 

    post '/signup' do 

    end 


    get '/logout' do
        if logged_in? 
            erb :'/user/logout'
        else
            redirect "/"
        end
    end

    post '/logout' do
        @current_user = nil
        session.clear
        redirect "/"
    end
end 