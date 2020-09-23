class CreateLogFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :cte_logs do |t|
      t.references :cte
      t.string :file_name
      t.text :content
      t.timestamps
    end

    create_table :cte_dexes do |t|
      t.references :cte
      t.string :file_name
      t.text :content
      t.timestamps
    end

    create_table :cte_data do |t|
      t.references :cte
      t.integer :dataset_number
      t.string :file_name
      t.text :content
      t.timestamps
    end
  end
end
