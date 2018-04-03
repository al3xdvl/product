class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.string :currency
      t.string :value
      t.references :prod, foreign_key: true

      t.timestamps
    end
  end
end
