class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.string  :location
      t.boolean :vendor
      t.boolean :customer
      t.boolean :blogger

      t.timestamps
    end
  end
end
