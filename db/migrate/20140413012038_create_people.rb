class CreatePeople < ActiveRecord::Migration
  def change
    create_table(:people) do |t|

      t.string :location, null: false
      t.string :name, null: false
      t.string :gender
      t.text :bio
      t.text :top_choices

      t.timestamps
    end
  end
end
