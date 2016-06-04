class AddBioToUsers < ActiveRecord::Migration
  def change
    add_column :monologue_users, :bio, :text
    add_column :monologue_users, :contact_email, :string
    add_column :monologue_users, :title, :string
  end
end
