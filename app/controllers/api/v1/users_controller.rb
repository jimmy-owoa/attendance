module Api
  class V1::UsersController < V1Controller
    SECRET_KEY_BASE = Rails.application.secrets.secret_key_base

    before_action :require_login

    def require_login
      response_unauthorized if current_user.blank?
    end

    def current_user
      if decoded_token.present?
        user_id = decoded_token[0]["user_id"]
        @user = User.find_by(id: user_id)
      else
        nil
      end
    end

    def encode_token(payload)
      JWT.encode payload, SECRET_KEY_BASE, "HS256"
    end

    def decoded_token
      if auth_header
        token = auth_header.split(" ")[1]
        begin
          JWT.decode token, SECRET_KEY_BASE, true, { algorithm: "HS256" }
        rescue JWT::DecodeError
          []
        end
      end
    end

    private

    def auth_header
      request.headers["Authorization"]
    end
  end
end
