require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride #middlewear product
use PlantsController
use SessionsController
use UsersController
run ApplicationController

