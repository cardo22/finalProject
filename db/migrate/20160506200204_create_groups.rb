class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :card
      t.integer :total_savings

      t.timestamps null: false
    end
  end
end
