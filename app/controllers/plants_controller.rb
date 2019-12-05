class PlantsController < ApplicationController

    get '/plants' do  #by convention, index route
        @plants = Plant.all  #@passes to view 
        erb :'plants/index' 
    end 

    get '/plants/new' do 
        erb :'plants/new' 
    end 

    post '/plants' do 
        @plant = Plant.new(water: params[:water], light: params[:light], price: params[:price])
        

        if @plant.save
            redirect '/plants'
        else 
            redirect '/plants/new'
        end 
        
    end 

    get '/plants/:id' do 
        if logged_in?
        @plant = Plant.find_by(params[:id])
            erb :'plants/show'
        else 
            redirect "/login"
        end 
    end 

    get '/plants/:id/edit' do 
        @plant = Plant.find_by_id(params[:id])
        if logged_on?
            erb :"/plants/edit"
        else
            redirect "/login"
        end 
    end

end
