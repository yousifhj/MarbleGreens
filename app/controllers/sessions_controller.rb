class SessionsController < ApplicationController

    get '/login' do
        erb :'/sessions/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:username])
          session[:user_id] = user.id
          redirect '/plants'
        else
          redirect '/login'
        end

      end


    get "/logout" do
        session.clear
        redirect "/"
    end

end 