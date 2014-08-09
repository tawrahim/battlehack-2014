class User < ActiveRecord::Base
	require 'sendgrid-ruby'

	def get_email(id)
		@user = User.find(id)
		return @user.email if @user
	end

end
