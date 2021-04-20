class ApplicationController < ActionController::Base
include DeviseWhitelist
include SetSource
    # protect_from_forgery with: :exception
end
