class AddCustomSlugToPosts < ActiveRecord::Migration
  def change
    add_column :monologue_posts, :slug, :string
  end
end
