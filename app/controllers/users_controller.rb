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
        if params[:username] == "" && params[:password] == ""
            redirect '/signup'
        else 
            @user = User.create(username: params[:username], password: params[:password])
            sessions[:user_id] = @user.id
            redirect "/plants"
        end 
    end 

    

end 