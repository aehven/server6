class CreateLogFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :cte_logs do |t|
      t.references :cte
      t.integer :timestamp
      t.text :content
      t.timestamps
    end

    create_table :cte_dxes do |t|
      t.references :cte
      t.integer :timestamp
      t.text :content
      t.timestamps
    end

    create_table :cte_data do |t|
      t.references :cte
      t.integer :dataset_number
      t.datetime :sample_bcd_datetime
      t.text :content
      t.timestamps
    end

    create_table :test_results do |t|
      t.references :patients_test_plan
      t.datetime :start_time
      t.integer :dataset_number
      t.integer :status
      t.text :notes
    end
  end
end
