class AddCustomToPosts < ActiveRecord::Migration
  def change
    add_column :monologue_posts, :page_id, :integer
    add_column :monologue_posts, :layout_name, :string
    add_column :monologue_posts, :custom_layout_content, :string
  end
end
