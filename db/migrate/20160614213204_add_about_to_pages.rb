class AddAboutToPages < ActiveRecord::Migration
  def change
    add_column :pages, :about, :text
    remove_column :monologue_posts, :about
  end
end
