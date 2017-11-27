class UsersController < ApplicationController

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


end
