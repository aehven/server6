class CreateBaseStations < ActiveRecord::Migration[6.0]
  def change
    create_table :base_stations do |t|
      t.integer :serial_number, null: false
      t.boolean :active, default: true
      t.text :encryption_key
      t.references :organization, null: true
      t.timestamps
    end
  end
end
