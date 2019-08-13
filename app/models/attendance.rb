class Attendance < ApplicationRecord #une participation
belongs_to :user #un participant pour une participation
belongs_to :event #une participation à un évènement
#after_create :invitation_email
#def invitation_email 
#UserMailer.invitation_email(self.event, self.user).deliver_now
#end
end