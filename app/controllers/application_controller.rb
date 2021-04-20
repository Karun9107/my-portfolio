class ApplicationController < ActionController::Base
include DeviseWhitelist
    # protect_from_forgery with: :exception

    before_action :set_source

    def set_source
        session[:source] = params[:q] if params[:q]
    end
end
