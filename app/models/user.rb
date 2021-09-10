class User < ApplicationRecord
	has_secure_password
	has_many :members, dependent: :destroy

	before_create :set_password

	def self.find_or_create_user user_params
    user = User.where(legal_number: user_params[:legal_number]).last
    unless user.present? 
      user = User.new(user_params)
      user.enabled = DateTime.now if user_params[:enabled] == "true"
			user.set_password
      user.save
    end
    user
  end

	def generate_password 
		(0...50).map { ('a'..'z').to_a[rand(26)] }.join
	end

	def set_password
		self.password = self.password_confirmation = generate_password if self.password.blank?
	end
end
