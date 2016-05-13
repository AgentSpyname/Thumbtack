class AddMenubarToPage < ActiveRecord::Migration
  def change
    add_column :pages, :menu, :boolean
  end
end
