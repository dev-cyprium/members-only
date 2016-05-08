class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 50 }
	validates :password, presence: true
	validates :password_confirmation, presence: true

	has_secure_password
end
