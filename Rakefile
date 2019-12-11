ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake' #only needed when running a rake task

task :console do #start up pry 
    Pry.start
end