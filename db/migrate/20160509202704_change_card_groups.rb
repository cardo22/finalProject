class ChangeCardGroups < ActiveRecord::Migration
  def change
  	change_column :groups, :card, :string
  end
end
