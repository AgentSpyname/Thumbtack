class CreateSelectedPosts < ActiveRecord::Migration
  def change
    create_table :selected_posts do |t|
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
