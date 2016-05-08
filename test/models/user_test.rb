require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
	def setup
		@user = User.new(
				name: "Example User",
				email: "user@example.com",
				password: 'password',
				password_confirmation: 'password'
			)
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "Name should be present" do
		@user.name = "     "
		assert_not @user.valid?
	end

	test "Email should be present" do
		@user.email = "    "
		assert_not @user.valid?
	end

	test "Name should not be too loong" do
		@user.name = "a" * 51
		assert_not @user.valid?
	end

	test "Password should be present ( not blank )" do
		@user.password = @user.password_confirmation = "     "
		assert_not @user.valid?
	end
end
