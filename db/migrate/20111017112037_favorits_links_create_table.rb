class FavoritsLinksCreateTable < ActiveRecord::Migration
  def up
    create_table :favorits_links, :id => false do |t|
      t.references :favorit
      t.references :link
    end
  end

  def down
    drop_table :favorits_links
  end
end
