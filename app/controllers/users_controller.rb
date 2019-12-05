class UsersController < ApplicationController



    get '/signup' do
        if !logged_in?
            erb :"users/signup"
        else 
            redirect "/plants"
        end 
    end 

    post '/signup' do 
        user = User.new(params)
        if user.save
            session["user_id"] = user.id
            redirect "/plants"
        else
            redirect "/signup"
        end
    end 

    get '/login' do 
        erb :'/users/login'
    end 

    post '/login' do
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session['user_id'] = @user.id
            redirect '/plants/index'
        else
            redirect '/login'
        end
    end

end 