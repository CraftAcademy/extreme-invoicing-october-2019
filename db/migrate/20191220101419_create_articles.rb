class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :unit
      t.float :unit_price
      t.float :taxrate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
