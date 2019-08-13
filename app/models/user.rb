class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	#belongs_to :city, optional: true
	has_many :events, through: :attendances
	has_many :attendances
	# has_secure_password with the Devise gem???

	# after_create :welcome_send
		
	# 	def welcome_send
	# 		UserMailer.welcome_email(self).deliver_now
	# 	end

end