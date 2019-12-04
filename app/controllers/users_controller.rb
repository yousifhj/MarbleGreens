class UsersController < ApplicationController

get '/signup' do
    if !logged_in?
        erb :"users/signup"
    else 
        redirect "/plants"
    end 
  end 

end 