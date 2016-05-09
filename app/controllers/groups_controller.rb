class GroupsController < ApplicationController
	def show
		user = current_user
		@goals = user.goals
		@groups = user.groups
		render 'group_page'
	end
end
