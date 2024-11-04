class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.where.not(id: current_user.id)
        authorize @users
    end

    def current
        @user = current_user
        authorize @user, :show?
    end
end
  