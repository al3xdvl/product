class AddMetaToProd < ActiveRecord::Migration[5.1]
  def change
    add_column :prods, :meta, :text
  end
end
