class Portfolio < ApplicationRecord
    include Placeholder
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
        #    if self.main_image == nil
        #        self.main_image =  Placeholder.image_generator(height:600, width:400)
        #    end 
        #end   
        self.main_image ||=  Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end
 