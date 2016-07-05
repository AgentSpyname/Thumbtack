class RemoveColumnMoreFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :more 
  end
end
