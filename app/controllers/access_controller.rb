class AccessController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])
        if @user 
            return head(:forbidden) unless @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            head(:forbidden)
        end
    end

    def login
    end

    def logout
        session[:user_id] = nil
        redirect_to root_path
    end
end
