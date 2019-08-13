class AttendancesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update]
	
	def index
	end

	def show
	end

	def new
		@attendance = Attendance.new
	end

	def edit
	end

	def create
		event = Event.find(params[:format])
		@attendance = Attendance.new(attended_event: event, user: current_user)
			if event.admin == current_user
				flash[:danger] = 'You can\'t registrate yourself for your event'
			elsif @attendance.save
				flash[:success] = 'You registrated for this event!'
			else
				flash[:danger] = 'There was a problem during the registration process'
			end
		redirect_to event
	end

	def update
	end

	def destroy
		puts params
		@attendance = Attendance.find(params[:id])
		event = @attendance.attended_event
		@attendance.destroy
		flash[:success] = "attendance successfully deleted"
    redirect_to event
  end

  private
end