class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.text :description
      t.string :location, null: false
      t.decimal :price, null: false, :precision => 8, :scale => 2
      t.belongs_to :vendor, null: false

      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end
  end
end
