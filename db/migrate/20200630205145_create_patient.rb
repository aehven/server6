class CreatePatient < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.datetime :dob
      t.references :organization
      t.timestamps
    end

    create_table :patients_users do |t|
      t.references :patient
      t.references :user
    end

    create_table :surgeries do |t|
      t.references :patient, null: false
      t.string :name
      t.datetime :date, null: false
      t.timestamps
    end
  end
end
