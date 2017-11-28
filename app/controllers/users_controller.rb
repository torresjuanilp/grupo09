class UsersController < ApplicationController
before_action :assign_permits

	def show
		#@user = User.find(params[ :id])
		@user = User.find(current_user.id)
	end

	def questions
		@user = User.find(current_user.id)
		@user.last_seen_at_before = @user.last_seen_at
		@user.last_seen_at = Time.current
		@user.save
	end

	def mispermisos
		@user = User.find(current_user.id)

	end

	def assign_permits
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
