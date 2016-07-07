class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.datetime :from_date
      t.datetime :to_date

      t.timestamps null: false
    end
  end
end
