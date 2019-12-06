class PlantsController < ApplicationController

    get '/plants' do  #by convention, index route
         @plants = Plant.all  #@passes to view 
        erb :'plants/index' 
    end 

    get '/plants/new' do 
        erb :'plants/new' 
    end 

    post '/plants' do 
        plant = current_user.plant.build(user_id: current_user.id, name: params[:plant],water: params[:water], light: params[:light], price: params[:price], greenhouse: params[:greenhouse])
        @greenhouse = Greenhouse.find_by(name: [params[:greenhouse]])
        
        if @greenhouse
           @plant.greenhouse = @greenhouse
        else 
            @plant.build_greenhouse(name: params[:greenhouse])
        end 
        if plant.save
            redirect '/plants'
        else 
            redirect '/plants/new'
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
