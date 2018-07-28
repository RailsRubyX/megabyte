class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :country
      t.string :oblast
      t.string :city
      t.string :street1
      t.string :street2
      t.string :mobile1
      t.string :mobile2
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
