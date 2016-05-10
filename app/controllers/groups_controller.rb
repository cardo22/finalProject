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
		new_group = Group.new(group_params)
		@groups = user.groups.push(new_group)
		id_params = params[:id] 
		if new_group.save
			redirect_to "/groups/#{id_params}"
		else
			render "new"
		end
	end

	private

	def group_params
		params.require(:group).permit(:name, :card)
	end
end
