class UsersController < ApplicationController
	def destroy 
		current_user.destroy
		flash[:notice] = "User Has been deleted"
		redirect_to "/"
	end
end