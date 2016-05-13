class GoalsController < ApplicationController
	before_action :check_if_admin 

	def check_if_admin
		groups = Group.find_by(id: params[:admin_id])
		unless current_user.id == groups
			return
		else
			redirect_to '/groups/#{current_user.id}'
		end
	end


	def show
		group = Group.find_by(id: params[:group_id])
		@goals = group.goals.find_by(id: params[:id])
		render 'goal'
	end

	def new
		@group = Group.find_by(id: params[:group_id])
		@goal = @group.goals.new
		render "new"
	end

	def create
		group = Group.find_by(id: params[:group_id])
		new_goal = group.goals.new(goals_params)
		@goals = current_user.goals.push(new_goal)
		if new_goal.save
			flash[:success] = "You created a Goal!"
			redirect_to  "/groups/#{group.id}/goals/#{new_goal.id}"
		else
			render "new"
		end
	end

	def edit
		@user = current_user.groups.find_by(id: params[:group_id])
		@goals = @user.goals.find(params[:id])
		render 'edit'
	end

	def update
		user = current_user.groups.find_by(id: params[:group_id])
		@goals = user.goals.find_by(id: params[:id])
		if @goals.update(goals_params)
			redirect_to action: "show", controller: "goals"
		else
			render "edit"
		end
	end


	def destroy
		user = current_user.groups.find_by(id: params[:group_id])
		@goals = user.goals.find_by(id: params[:id])
		puts current_user.inspect
		puts @goals.inspect
		@goals.destroy
		redirect_to "/groups/#{user.id}"

		# user = current_user
		# @goals = user.goals.find_by(id: params[:id])
		# @goals.destroy
		# redirect_to '/goals/new'
	end

	private

	def goals_params
		params.require(:goal).permit(:goal_name, :goal_amount)
	end
end
