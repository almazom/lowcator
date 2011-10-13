class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :url_thumbnail_path
      t.string :tag_list
      t.boolean :published
      t.references :user
      t.timestamps
    end

    #add_index :title, :description
  end
end
