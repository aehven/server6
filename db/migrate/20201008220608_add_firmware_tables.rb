class AddFirmwareTables < ActiveRecord::Migration[6.0]
  def change
    create_table :firmwares do |t|
      t.integer :kind, null: false
      t.integer :major, null: false
      t.integer :minor, null: false
      t.integer :bugfix, null: false
      t.integer :build, null: false
      t.boolean :critical, null: false
      t.text :image, null: false, limit: 1000000
      t.timestamps
    end
  end
end
