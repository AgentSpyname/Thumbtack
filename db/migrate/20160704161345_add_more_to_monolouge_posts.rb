class AddMoreToMonolougePosts < ActiveRecord::Migration
  def change
    add_column :monologue_posts, :more, :boolean
  end
end
