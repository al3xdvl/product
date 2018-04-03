class CreateProds < ActiveRecord::Migration[5.1]
  def change
    create_table :prods do |t|
      t.string :name
      t.string :size
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
