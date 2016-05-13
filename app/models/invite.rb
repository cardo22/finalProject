class Invite < ActiveRecord::Base
	enum status: [:pending, :decline, :accepted]
	belongs_to :group
end
