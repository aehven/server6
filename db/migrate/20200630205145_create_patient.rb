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
      t.datetime :surgery_date
      t.references :organization
      t.timestamps
    end

    create_table :patients_users do |t|
      t.references :patient
      t.references :user
    end
  end
end
