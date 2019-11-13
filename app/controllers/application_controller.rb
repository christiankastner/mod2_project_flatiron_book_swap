class ApplicationController < ActionController::Base
    helper_method :set_current_user

    def set_current_user
        @current_user = session[:user_id]
    end
end
