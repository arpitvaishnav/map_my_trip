class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :place
      t.text :description

      t.timestamps null: false
    end
  end
end
