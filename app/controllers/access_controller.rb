class AccessController < ApplicationController

    def login
        @user = User.new
    end

    def logout
    end
        
end
