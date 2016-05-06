class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :goal_name
      t.integer :goal_amount

      t.timestamps null: false
    end
  end
end
