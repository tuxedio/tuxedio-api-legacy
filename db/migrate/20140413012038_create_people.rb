class CreatePeople < ActiveRecord::Migration
  def change
    create_table(:people) do |t|
      t.string :location
      t.string :name, null: false
      t.string :gender
      t.string :hometown
      t.string :facebook_link
      t.string :locale
      t.text :bio
      t.text :top_choices
      t.date :date_of_birth

      t.timestamps
    end
  end
end
