module Api::V1
    class  Users::DashboardsController < UsersController
      def index
        render json: User.all
      end
    end
  end