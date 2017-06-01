class UsersController < ApplicationController

	def destroy
				User.find(params[:id]).destroy
				flash[:alert] = "You have deleted your profile."
				redirect_to root_path
	end

end