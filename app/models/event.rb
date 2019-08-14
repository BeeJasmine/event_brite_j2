class Event < ApplicationRecord

belongs_to :user #un user (admin) crée un event
has_many :users, through: :attendances #plusieurs users peuvent participer
has_many :attendances #plusieurs users = plusieurs participations (join table) 

validates :start_date, 
		presence: 
		true, 
		# :not_past_date #ne peut pas avoir lieu dans le passé :
		numericality: { greater_than_or_equal_to: Time.now.to_i }

validates :duration,
		presence: true,
		numericality: { only_integer: true, greater_than: 0 } #integer == %5

validates :multiple_of_5,
		presence: true

validates :title,
		presence: true, 
		length: {minimum: 5, maximum: 140} # { in 5..140 } #titre entre 5 et 140 caractères #{minimum: 5, maximum: 140}

validates :description, 
		length: {minimum: 20, maximum: 1000} #{ in 20..1000 } #description entre 20 et 1000 caractères

validates :price, 
		presence: true, 
		numericality: {only_integer: true, minimum: 1, maximum: 1000}#in 1..1000} #integer in 1..1000 #{greater_than: 0, less_than: 1000}

validates :location, 
		presence: true #le lieu est obligatoire


	private

	def multiple_of_5
		duration % 5 == 0 ? true : error.add(:duration, "have to be one multiple of 5")
	end	

	#  def not_past_date
	#  	if self.date < Date.today #Time.now?
	#  		errors.add(:date, 'not in past')
	# # 	end
	#  end

end