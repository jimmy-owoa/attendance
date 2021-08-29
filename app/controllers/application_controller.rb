class ApplicationController < ActionController::API
	def response_unauthorized
    render status: 401, json: { status: 401, message: 'Unauthorized' }
  end

  def response_internal_server_error
    render status: 500, json: { status: 500, message: 'Internal Server Error' }
  end
end
