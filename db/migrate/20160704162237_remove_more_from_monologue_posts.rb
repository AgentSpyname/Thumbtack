class RemoveMoreFromMonologuePosts < ActiveRecord::Migration
  def change
    remove_column :monologue_posts, :more, :boolean
  end
end
