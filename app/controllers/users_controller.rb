class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.where.not(id: current_user.id)
        render json: @users.as_json
    end

    def current
        render json: current_user.as_json
    end
end
  