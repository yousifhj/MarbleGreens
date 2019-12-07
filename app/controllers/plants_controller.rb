class PlantsController < ApplicationController

    get '/plants' do  #by convention, index route
         @plants = Plant.all  #@passes to view 
        erb :'plants/index' 
    end 

    get '/plants/new' do 
        erb :'plants/new' 
    end 

    post '/plants' do 
        plant = current_user.plants.build(name: params[:plant],water: params[:water], light: params[:light], price: params[:price], greenhouse: params[:greenhouse],user_id: current_user.id)
        if  params[:name].empty? || params[:water].empty? ||params[:light].empty? || params[:price].empty? || params[:greenhouse].empty?
            redirect '/plants/new'   
        else plant.save
            redirect '/plants'
        end 
        
    end 

    get '/plants/:id' do 
        if logged_in?
        @plant = current_user.plants.find_by(params[:id])
            erb :'plants/show'
        else 
            redirect "/login"
        end 
    end 

    get '/plants/:id/edit' do 
        @plants = current_user.plants.find_by_id(params[:id])
        if current_user
            erb :"/plants/edit"
        else
            redirect "/login"
        end 
    end

end
