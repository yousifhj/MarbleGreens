class Plant < ActiveRecord::Base
    belongs_to :greenhouse
    belongs_to :user
end 