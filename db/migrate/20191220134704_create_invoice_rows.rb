class CreateInvoiceRows < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_rows do |t|
      t.references :invoice, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
