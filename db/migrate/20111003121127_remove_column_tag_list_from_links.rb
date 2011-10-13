class RemoveColumnTagListFromLinks < ActiveRecord::Migration
  def up
    remove_column :links, :tag_list
  end

  def down
    add_column :links, :tag_list
  end
end
