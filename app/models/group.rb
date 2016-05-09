class Group < ActiveRecord::Base
	has_many :memberships
	has_many :users, through: :memberships

	has_many :goals

	validates :card, length: { is: 16}
	validates :card, presence: true
end
