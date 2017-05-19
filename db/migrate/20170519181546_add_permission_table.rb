class AddPermissionTable < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.integer :name
    end
  end
end
