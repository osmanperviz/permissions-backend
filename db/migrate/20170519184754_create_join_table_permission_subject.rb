class CreateJoinTablePermissionSubject < ActiveRecord::Migration[5.0]
  def change
    create_join_table :permissions, :subjects do |t|
       t.index [:permission_id, :subject_id]
    end
  end
end
