class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :resolve_layout
  respond_to_mobile_requests
  Paperclip::Railtie.insert
  
  private   
        def resolve_layout
         case action_name
           when "edit", "new"
            "update"
           else 
            "mobile"
           end
        end
end
