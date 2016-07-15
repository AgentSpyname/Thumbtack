class AddAboutToMonologuePosts < ActiveRecord::Migration
  def change
    add_column :monologue_posts, :about, :text
  end
end
