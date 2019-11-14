class UsersController < ApplicationController
    # before_action :supply_user, only: [:new]
    before_action :find_user, only: [:edit, :update, :destroy]
    before_action :check_current_user, only: [:show]
    has_many :passive_relationships, through: :shelf_books

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        byebug
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            @shelf = Shelf.create(user_id: @user.id)
            session[:user_id] = @user.id
            session[:shelf_id] = @shelf.id
            redirect_to @user
        else
            render :new
        end
    end

    def edit
    end

    def update  
        @user.assign_attributes(user_params)
        if @user.save
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
        @user.shelf.destroy
        @user.destroy
        session[:user_id] = @user.id
        session[:shelf_id] = @shelf.id
        redirect_to root_path
    end

    private
    def supply_user
        @user = User.new
    end

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :name, :email)
    end

    def check_current_user
        @user = User.find(params[:id])
        @is_current_user = session[:user_id] == @user.id
    end
end
