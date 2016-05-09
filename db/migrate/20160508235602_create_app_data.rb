class CreateAppData < ActiveRecord::Migration
  def change
    create_table :app_data do |t|
      t.string :name
      t.text :contents

      t.timestamps null: false
    end
  end
end
