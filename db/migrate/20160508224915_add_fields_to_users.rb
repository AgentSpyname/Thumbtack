class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :monologue_users, :role, :string
    drop_table :stylesheets
  end
end
