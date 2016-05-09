class AddIDtoPostAndPage < ActiveRecord::Migration
  def change
    add_column :monologue_posts, :layout_id, :integer
    add_column :pages, :layout_id, :integer
  end
end
