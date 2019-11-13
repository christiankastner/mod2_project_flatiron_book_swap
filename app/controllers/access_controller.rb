class AccessController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])
        if @user and @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:message] = "Username or password did not match an existing profile"
            render :login
        end
    end

    def login
    end

    def logout
        session[:user_id] = nil
        redirect_to root_path
    end
end
