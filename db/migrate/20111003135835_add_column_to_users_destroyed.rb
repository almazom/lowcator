class AddColumnToUsersDestroyed < ActiveRecord::Migration
  def change
    add_column :users, :is_destroyed, :boolean
  end
end
