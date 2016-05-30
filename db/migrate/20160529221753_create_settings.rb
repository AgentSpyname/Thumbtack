class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.string :contents
      t.boolean :data

      t.timestamps null: false
    end
  end
end
