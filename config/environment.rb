ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup' #gem file 
Bundler.require(:default, ENV['SINATRA_ENV']) #requiring all gems 

ActiveRecord::Base.establish_connection(  #establish database connection; sets name of database management
  :adapter => "sqlite3", 
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app' #loads files in app
