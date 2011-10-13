class RemoveRowsFromLinks < ActiveRecord::Migration
  def up
    remove_column :links, :title
    remove_column :links, :url_thumbnail_path
  end

  def down
    add_column :links, :title
    add_column :links, :url_thumbnail_path
  end
end

#t.string   "title"
#t.text     "description"
#t.string   "url"
#t.string   "url_thumbnail_path"
#t.boolean  "published"
#t.integer  "user_id"
#t.datetime "created_at"
#t.datetime "updated_at"
