class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :name
      t.belongs_to :person, null: false
      t.string :location
      t.date :start_date
      t.integer :number_of_days
    end
  end
end
