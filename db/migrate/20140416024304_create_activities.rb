class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :location
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :vendor_id

      t.timestamps
    end
  end
end
