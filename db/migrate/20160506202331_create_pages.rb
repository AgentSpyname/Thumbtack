class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :nested
      t.boolean :postable
      t.string :slug
      t.boolean :static

      t.timestamps null: false
    end
  end
end
