class AddSlugToMonologueUsers < ActiveRecord::Migration
  def change
    add_column :monologue_users, :slug, :string
  end
end
