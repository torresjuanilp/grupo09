class UsersController < ApplicationController
before_action :assign_permits

	def show
		@user = User.find(params[ :id])
	end

	def questions
	if user_signed_in?
		@user = User.find(current_user.id)
		@user.last_seen_at_before = @user.last_seen_at
		@user.last_seen_at = Time.current
		@user.save
	end
	end

	def answers
	if user_signed_in?
		@user = User.find(current_user.id)
	end
	end

	def mispermisos
	if user_signed_in?
		@user = User.find(current_user.id)
	end
	end

	def assign_permits
	if user_signed_in?
		@user = User.find(current_user.id)
		Permit.all.each do |p|
			if @user.puntaje >= p.score
				if @user.permits.find_by(name: p.name) == nil
					@user.permits << Permit.find_by(name: p.name)
				end
			end
		end
	end
	end
end
