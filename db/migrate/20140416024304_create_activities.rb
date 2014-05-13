class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :location
      t.decimal :price, :precision => 8, :scale => 2
      t.belongs_to :vendor

      t.timestamps
    end
  end
end
