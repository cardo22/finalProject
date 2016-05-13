class Group < ActiveRecord::Base
	has_many :memberships
	has_many :users, through: :memberships

	has_many :goals

	has_many :invites

	validates :card, length: { is: 16}
	validates :card, presence: true
end
