class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   #before_action :authenticate_user!     
	

	def get_email(id)
		@user = User.find(id)
		return @user.email if @user
	end

end
