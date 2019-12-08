class PlantsController < ApplicationController

    get '/plants' do  #by convention, index route
        if logged_in?
            user = current_user
            @plants = user.plants
            # binding.pry
            erb :'plants/index' 
        else 
            redirect "/login"
        end 

    end 

    get '/plants/new' do 
        erb :'plants/new' 
    end 

    post '/plants' do 
       # binding.pry
       if  params[:name] == "" || params[:water] == ""  || params[:light] == "" || params[:price] == ""  || params[:greenhouse_name] == "" 
            redirect '/plants/new'        
       end
        greenhouse = Greenhouse.create(name: params[:greenhouse_name])
        plant = current_user.plants.build(name: params[:name],water: params[:water], light: params[:light], price: params[:price], greenhouse_id: greenhouse.id, user_id: current_user.id)
        if plant.save
            redirect '/plants'             
        else
            redirect '/plants/new'  
        end         
    end 

    get '/plants/:id' do 
        if logged_in?
            user = current_user
            @plant = user.plants.find_by(id: params[:id])
            if @plant 
                erb :'plants/show'
            else  
                redirect '/plants'
            end 
        else 
            redirect "/login"
        end 
    end 


    get '/plants/:id/edit' do 
        if current_user
            @plant = current_user.plants.find_by(id: params[:id])
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

    delete '/plants/:id' do 
        if !logged_in?
            redirect '/'
        else @plant = current_user.plants.find_by(id: params[:id])
            @plant.destroy
            redirect '/plants'
        end 
    end 
end
