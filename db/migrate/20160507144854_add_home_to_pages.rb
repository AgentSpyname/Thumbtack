class AddHomeToPages < ActiveRecord::Migration
  def change
    add_column :pages, :homepage, :boolean
  end
end
