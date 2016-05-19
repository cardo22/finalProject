class AddCurrentAmountToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :current_amount, :float
  end
end
