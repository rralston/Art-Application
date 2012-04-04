class ApplicationController < ActionController::Base
  protect_from_forgery
  Paperclip::Railtie.insert
end
