class AddPhoneNumberToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :phone_num, :string
  end
end
