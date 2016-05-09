class AddGroupIdToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :group_id, :integer
  end
end
