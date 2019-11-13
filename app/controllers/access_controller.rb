class AccessController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
    end

    def login
    end

    def logout
        session[:user_id] = @user.id
        redirect_to root_path
    end
end
