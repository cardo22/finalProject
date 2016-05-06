class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.number :user_id
      t.number :group_id

      t.timestamps null: false
    end
  end
end
