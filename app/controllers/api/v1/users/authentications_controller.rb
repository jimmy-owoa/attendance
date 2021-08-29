module Api::V1
  class Users::AuthenticationsController < UsersController
    skip_before_action :require_login, only: :create

    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        payload = { user_id: user.id, email: user.email }
        token = encode_token(payload)
        render json: { jwt: token, status: 200, message: 'You are logged in successfully' }
      else
        response_unauthorized
      end
    end
  end
end