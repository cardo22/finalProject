class InvitesController < ApplicationController
	def index
		group = Group.find(params[:group_id])
		@invites = group.invites.order(created_at: :asc)
		                              .limit(20)
		render 'invites'
	end
end
