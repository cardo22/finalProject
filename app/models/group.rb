class Group < ActiveRecord::Base
	has_may :memberships
	has_may :users, through: :memberships

	has_may :goals
end
