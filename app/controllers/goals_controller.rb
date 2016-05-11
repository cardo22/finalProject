class GoalsController < ApplicationController
	def show
		@goals = Goal.find_by(id: params[:id])
		render 'goal'
	end

	def new
		@goal =Goal.new
		render "new"
	end

	def edit
		
	end

	private

	def goals_params
		params.require(:goals).permit(:goal_name, :goal_amount)
	end
end
