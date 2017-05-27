class AddPermissionTable < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.integer :name
      t.integer :user_id
      t.integer :group_id
      t.integer :subject_id
    end
  end
end
