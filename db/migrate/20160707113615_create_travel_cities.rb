class CreateTravelCities < ActiveRecord::Migration
  def change
    create_table :travel_cities do |t|
      t.string :from_city
      t.string :to_city
      t.datetime :started_on
      t.datetime :reache_on
      t.integer :how_id
      t.references :trip, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
