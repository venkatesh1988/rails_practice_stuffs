class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :primary_address
      t.string :secondary_address
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
