class CreatePeople < ActiveRecord::Migration
  def change
    create_table(:people) do |t|

      t.string :location, null: false
      t.string :name, null: false
      t.string :gender
      t.text :bio
      t.text :top_choices
      t.datetime :date_of_birth

      t.timestamps
    end
  end
end
