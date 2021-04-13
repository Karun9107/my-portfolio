class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.angular_portfolio_item
        where(subtitle: "Angular")
    end

    scope :ruby_on_rails_portfolio_item, -> {
        where(subtitle: "Ruby on Rails")
    } 

    after_initialize  :set_defaults

    def set_defaults
        #begin
        #    if self.main_image = nil
        #        self.main_image ||=  "https://place-hold.it/600x400"
        #    end 
        #end   
        self.main_image ||=  "https://place-hold.it/600x400"
        self.thumb_image ||=  "https://place-hold.it/350x200"
    end
end
 