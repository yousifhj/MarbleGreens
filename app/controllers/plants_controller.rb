class PlantsController < ApplicationController

    get '/plants' do  #by convention, index route
         @plants = Plant.all  #@passes to view 
        erb :'plants/index' 
    end 

    get '/plants/new' do 
        erb :'plants/new' 
    end 

    post '/plants' do 
       # binding.pry
       if  params[:name].empty? || params[:water].empty? ||params[:light].empty? || params[:price].empty? || params[:greenhouse_name].empty?
            redirect '/plants/new'        
       end
        greenhouse = Greenhouse.create(name: params[:greenhouse_name])
        plant = current_user.plants.build(name: params[:name],water: params[:water], light: params[:light], price: params[:price], greenhouse_id: greenhouse.id)
        if plant.save
            redirect '/plants'             
        else
            redirect '/plants/new'  
        end         
    end 

    get '/plants/:id' do 
        if logged_in?
        @plant = current_user.plants.find_by_id(params[:id])
            erb :'plants/show'
        else 
            redirect "/login"
        end 
    end 


    get '/plants/:id/edit' do 
        if current_user
            @plants = current_user.plants.find_by(id: params[:id])
            erb :"plants/edit"
        else
            redirect "/login"
        end 
    end

    patch '/plants/:id' do 
        @user = current_user
        @plants = @user.plants.find_by(id: params[:id])
        if !@user
            redirect '/login'
        else
            @plants.update(name: params[:name],water: params[:water], light: params[:light], price: params[:price], greenhouse_id: greenhouse.id)
            redirect "/plants/#{@plants.id}"
        end
    end 

end
