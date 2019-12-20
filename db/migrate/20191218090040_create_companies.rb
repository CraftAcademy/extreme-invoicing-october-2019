class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :identification_no
      t.integer :vat_no
      t.string :address
      t.string :postcode
      t.string :city
      t.integer :phone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
