class CreateLogFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :cte_logs do |t|
      t.references :cte
      t.string :file_name
      t.text :content
      t.timestamps
    end

    create_table :test_logs do |t|
      t.references :cte
      t.string :file_name
      t.text :content
      t.timestamps
    end
  end
end
