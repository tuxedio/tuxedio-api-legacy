class CreateVendors < ActiveRecord::Migration
  def change
    create_table(:vendors) do |t|

      t.string :name, null: false
      t.string :location, null: false
      t.integer :zip_code, null: false
      t.text :description

      t.timestamps
    end
  end
end
