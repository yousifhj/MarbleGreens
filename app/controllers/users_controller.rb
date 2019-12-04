class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :"users/signup"
        else 
            redirect "/plants"
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