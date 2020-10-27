class AddCteResults < ActiveRecord::Migration[6.0]
  def change
    create_table :cte_result_headers do |t|
      t.references :cte_data
      t.string :app_version
      t.string :matlab_version
      t.string :when_calculated
      t.integer :sequence_no
      t.integer :company_id
      t.float :tibia_length_used
      t.string :tibia_length_source
    end

    create_table :cte_results do |t|
      t.references :cte_result_header
      t.integer :qualified_gait_cycle
      t.float :gc_start
      t.float :gc_end
      t.float :cadence
      t.float :stride_length
      t.float :walk_speed
      t.float :tib_rom
      t.float :knee_rom
      t.integer :company_id
    end

    create_table :cte_stepcounts do |t|
      t.references :cte_result_header
      t.integer :stepcount
      t.string :created_on
      t.integer :company_id
    end
  end
end
