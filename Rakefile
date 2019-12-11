ENV["SINATRA_ENV"] ||= "development" #loads app's environment.rb file

require_relative './config/environment'
require 'sinatra/activerecord/rake' #only needed when running a rake task

# type 'rake-T' on command line to see avaiable rake tasks 

task :console do #start up pry 
    Pry.start
end