class GreenhousesController < ApplicationController

    get '/greenhouses' do 
        @greenhouses = Greenhouse.all 
        erb :'/greenhouses/index'
    end 

end 