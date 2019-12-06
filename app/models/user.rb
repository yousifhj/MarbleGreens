class User < ActiveRecord::Base
    has_secure_password
    validates_presence_of :username, :email
    has_many :plants
    

    def slug 
        user.downcase.gsub(" ", "-")
    end 

    def self.find_by_slug(slug)
        USer.all.find{|user| user.slug == slug}
    end 

end 