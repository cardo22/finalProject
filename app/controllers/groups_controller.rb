# require 'wepay'

class GroupsController < ApplicationController
	def show
		# id1 = ENV['client_id']
		# client_secret = ENV['client_secret']
		# redirect_uri = "http://localhost:300"
		# wepay = WePay::Client.new(id, client_secret)

		@group_id = params[:id]
		group = Group.find(params[:id])
		@group_invites = group.invites
		@users = group.users
		user = current_user
		@goals = group.goals
		@groups = user.groups.where(id: params[:id])

		@total_savings = 0

		@goals.each do |goal|
			@total_savings += goal.current_amount
		end
		render 'group_page'
	end

	def new
		@groups = Group.new
		render "new"
	end

	def edit
		user = current_user
		@group = user.groups.find(params[:id])
		render "edit"
	end

	def update
		user = current_user
		@group = user.groups.find_by(id: params[:id])
		if @group.update(group_params)
			redirect_to action: "show", controller: "groups"
		else
			render "edit"
		end
	end

	def destroy
		user = current_user
		@groups = user.groups.find_by(id: params[:id])
		@groups.destroy
		redirect_to '/groups/new', :notice => "Your group has been deleted"
	end

	def create
		user = current_user
		new_group = Group.new(group_params)
		@group = user.groups.push(new_group)
		puts id_params = params[:id] 
		if new_group.save
			redirect_to "/groups/#{new_group.id}/edit"
		else
			render "new"
		end
	end

	private

	def group_params
		params.require(:group).permit(:name, :card, :total_savings)
	end
end
