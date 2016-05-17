class AddSavedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :saved, :integer
  end
end
