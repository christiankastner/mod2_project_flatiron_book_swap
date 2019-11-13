class UsersController < ApplicationController
    before_action :supply_user, only: [:new]
    before_action :check_current_user, only: [:show]

    def index
    end

    def show
        @user = User.find(params[:id])
    end

    def new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            session[:user] = @user
            redirect_to @user
        else
            render :new
        end
    end


    private
    def supply_user
        @user = User.new
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :name, :email)
    end

    def check_current_user
        @user = User.find(params[:id])
        @is_current_user = session[:user_id] == @user.id
    end
end
