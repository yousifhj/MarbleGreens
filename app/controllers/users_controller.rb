class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :"users/signup"
        else 
            redirect "/plants"
        end 
    end 
 
    post '/signup' do
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if @user.save
          session[:user_id] = @user.id
          redirect '/plants'
        else
          erb :'/plants/index'
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
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect '/plants'
        else
          erb :'/users/login'
        end
      end

    get '/logout' do
      session.clear
      erb :'/index'
    end

end 