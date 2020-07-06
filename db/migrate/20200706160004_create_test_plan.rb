class CreateTestPlan < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :name, null: false
    end

    create_table :test_plans do |t|
      t.string :name, null: false
    end

    create_table :test_plans_tests do |t|
      t.references :test, null: false
      t.references :test_plan, null: false
      t.integer :duration, null: false
    end

    create_table :patients_test_plans do |t|
      t.references :patient, null: false
      t.references :test_plan, null: false
    end

    create_table :organizations_tests do |t|
      t.references :organization, null: false
      t.references :test, null: false
    end

    create_table :organizations_test_plans do |t|
      t.references :organization, null: false
      t.references :test_plan, null: false
    end
  end
end
