class CreateLayouts < ActiveRecord::Migration
  def change
    create_table :layouts do |t|
      t.string :name
      t.text :custom_layout
      t.string :layout_type

      t.timestamps null: false
    end
  end
end
