class ApplicationController < ActionController::Base
include DeviseWhitelist
    # protect_from_forgery with: :exception

end
