class CreateCtes < ActiveRecord::Migration[6.0]
  def change
    create_table :ctes do |t|
      t.string :name
      t.integer :radio_id
      t.string :serial_number
      t.text :encryption_key
      t.timestamps
    end

    create_table :ctes_patients do |t|
      t.references :cte
      t.references :patient
      t.timestamps
    end
  end
end
