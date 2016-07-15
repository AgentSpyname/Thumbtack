class AddMoreToPages < ActiveRecord::Migration
  def change
    add_column :pages, :more, :boolean
  end
end
