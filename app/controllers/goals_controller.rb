class GoalsController < ApplicationController
	def show
		@goals = Goal.find_by(id: params[:id])
		render 'goal'
	end

	def new
		@goal =Goal.new
		render "new"
	end

	def create
		unless current_user.admin
			redirect_to action: "show", controller: "groups"
			return
		end

		user = current_user
		new_goal = Goal.new(goals_params)
		@goals = user.goals.push(new_goal)
		if new_goal.save
			redirect_to "/goals/#{new_goal.id}/edit"
		else
			render "new"
		end
	end

	def edit
		unless current_user.admin
			redirect_to action: "show", controller: "goals"
			return
		end

		user = current_user
		@goals = user.goals.find(params[:id])
		render 'edit'
	end

	private

	def goals_params
		params.require(:goals).permit(:goal_name, :goal_amount)
	end
end
