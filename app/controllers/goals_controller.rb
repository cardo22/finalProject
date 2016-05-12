class GoalsController < ApplicationController
	def show
		@goals = Goal.find_by(id: params[:id])
		render 'goal'
	end

	def new
		@goal = Goal.new
		render "new"
	end

	def create
		unless current_user.admin
			redirect_to action: "show", controller: "groups"
			return
		end

		new_goal = Goal.new(goals_params)
		@goals = current_user.goals.push(new_goal)
		if new_goal.save
			flash[:success] = "You created a Goal!"
			redirect_to  "/groups/#{current_user.id}"
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
		@goal = user.goals.find(params[:id])
		render 'edit'
	end

	def update
		user = current_user
		@goals = user.goals.find_by(id: params[:id])
		if @goals.update(goals_params)
			redirect_to action: "show", controller: "goals"
		else
			render "edit"
		end
	end


	def destroy
		if !current_user.admin
			redirect_to action: "show", controller: "goals"
		else

			@goals = current_user.goals.find_by(id: params[:id])
			puts current_user.inspect
			puts @goals.inspect
			@goals.destroy
			redirect_to "/groups/#{current_user.id}"
		end

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
