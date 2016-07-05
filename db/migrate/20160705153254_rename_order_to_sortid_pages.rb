class RenameOrderToSortidPages < ActiveRecord::Migration
  def change
    rename_column :pages, :order, :sort_id

  end
end
