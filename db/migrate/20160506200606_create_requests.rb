class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :reason
      t.string :request_amount

      t.timestamps null: false
    end
  end
end
