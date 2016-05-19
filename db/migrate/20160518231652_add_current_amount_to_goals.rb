class AddCurrentAmountToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :current_amount, :float, default: 0;
  end
end
