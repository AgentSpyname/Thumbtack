class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
    
    add_column :pages, :template_id, :integer
    add_column :monologue_posts, :template_id, :integer
  end
end
