class AddLinkToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :link, :string
  end
end
