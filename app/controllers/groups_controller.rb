class GroupsController < ApplicationController
	def show
		user = current_user
		@goals = user.goals
		@groups = user.groups
		render 'group_page'
	end

	def new
		@groups = Group.new
		render "new"
	end

	def create
		user = current_user
		@groups = Group.new(group_params)
		if @groups.save
			redirect_to action: "show", controller: "groups"
		else
			render "new"
		end
	end

	private

	def group_params
		params.require(:groups).permit(:name, :card)
	end
end
