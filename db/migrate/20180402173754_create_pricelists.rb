class CreatePricelists < ActiveRecord::Migration[5.1]
  def change
    create_table :pricelists do |t|
      t.string :name
      t.string :value
      t.belongs_to :price, foreign_key: true

      t.timestamps
    end
  end
end
