class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 50 }
	validates :password, presence: true
	validates :password_confirmation, presence: true
	before_create :generate_token

	has_secure_password

	private

		def generate_token
			token = SecureRandom.urlsafe_base64
			encripted = Digest::SHA1.hexdigest(token.to_s)
			self.remember_token = encripted
		end
end
