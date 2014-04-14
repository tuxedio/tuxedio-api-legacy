class AddTopChoicesToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :top_choices, :text
  end
end
