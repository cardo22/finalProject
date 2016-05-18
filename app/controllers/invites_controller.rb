class InvitesController < ApplicationController
	def index
		@group = Group.find_by(id: params[:group_id])
		@invites = @group.invites.order(created_at: :asc)
		                              .limit(20)
		render 'invites'
	end

	def show
		@group = Group.find_by(id: params[:group_id])
		@invites = @group.invites.find_by(id: params[:id])
		render 'show'
	end

	def new
		@group = Group.find_by(id: params[:group_id])
		@invites = @group.invites.new
		render 'new'
	end

	def create
		# new_invite = Invite.new(invite_params)
		@group = Group.find_by(id: params[:group_id])
		@invites = @group.invites.new(invite_params)
		if @invites.save
			flash[:success] = "Your invite was sent successfully!"
			redirect_to action: "index", controller: "invites"
		else
			render 'new'
		end
	end

	def edit
		@group = Group.find_by(id: params[:group_id])
		@invites = @group.invites.find(params[:id])
		render 'edit'
	end

	def update
		@group = Group.find_by(id: params[:group_id])
		@invites = @group.invites.find(params[:id])
		if @invites.update(invite_params)
			redirect_to action: "index", controller: "invites"
		else
			render "edit"
		end
	end	

	private

	def invite_params
		params.require(:invite).permit(:phone_num, :email, :name, :link)
	end
end
