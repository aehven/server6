class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.integer :kind, default: 0
      t.string :name, index: true
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone1
      t.string :phone2
      t.string :phone3
      t.string :email1
      t.string :email2
      t.string :email3
      t.boolean :active

      t.integer :parent_id, null: true, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true
      t.integer :depth, null: false, default: 0, index: true
      t.integer :children_count, null: false, default: 0

      t.timestamps
    end

    create_table :organizations_users do |t|
      t.references :organization
      t.references :user
    end
  end
end
