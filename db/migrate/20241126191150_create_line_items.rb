class CreateLineItems < ActiveRecord::Migration[8.0]
  def change
    create_table :line_items do |t|
      t.references :invoice, null: false, foreign_key: true
      t.string :name_of_traveler
      t.datetime :start_date
      t.datetime :end_date
      t.string :description
      t.string :category
      t.integer :quantity
      t.integer :price_cents
      t.string :price_currency
      t.float :vat_rate

      t.timestamps
    end
  end
end
