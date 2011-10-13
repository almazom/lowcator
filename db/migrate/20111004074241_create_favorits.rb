class CreateFavorits < ActiveRecord::Migration
  def change
    create_table :favorits do |t|
      t.integer :user_id
      t.integer :link_id
      #t.datetime :favorited_at

      t.timestamps
    end
  end
end
