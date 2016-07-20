class AddMapDetailsToTables < ActiveRecord::Migration
  def change
    add_column :travel_cities, :from_lng, :string
    add_column :travel_cities, :from_lat, :string
    add_column :travel_cities, :from_address, :string
    add_column :travel_cities, :to_lng, :string
    add_column :travel_cities, :to_lat, :string
    add_column :travel_cities, :to_address, :string
  end
end
