class CreateJoinTablePermissionGroup < ActiveRecord::Migration[5.0]
  def change
    create_join_table :permissions, :groups do |t|
       t.index [:permission_id, :group_id]
    end
  end
end
