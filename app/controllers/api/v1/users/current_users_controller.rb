module Api::V1
  class Users::CurrentUsersController < UsersController
    def show
      render json: current_user
    end
  end
end