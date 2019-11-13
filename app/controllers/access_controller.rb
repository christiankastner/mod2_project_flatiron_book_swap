class AccessController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
    end

    def login
        @user = User.new
    end

    def logout
    end

        
end
