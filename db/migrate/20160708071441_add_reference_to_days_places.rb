class AddReferenceToDaysPlaces < ActiveRecord::Migration
  def change
    add_reference :places, :day, index: true
  end
end
