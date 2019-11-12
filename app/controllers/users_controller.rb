class UsersController < ApplicationController
    def index
    end

    def login
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end
end
