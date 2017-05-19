class CreateJoinTableUserPermission < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :permissions do |t|
       t.index [:user_id, :permission_id]
    end
  end
end
