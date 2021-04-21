module CurrentUserConcern
    extend ActiveSupport::Concern
    
    def guest_user
      OpenStruct.new({  name: "Guest User",
                        first_name:"Guest",
                        last_name:"User", 
                        email:"guest@test.com"
                    })
    end
    
    def current_user
        super ||  guest_user
    end

end