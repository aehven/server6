class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.timestamps
      t.string :title
      t.text :text
      t.integer :level
      t.datetime :expires_at
      t.boolean :in_app
      t.boolean :email
      t.boolean :sms
      t.string :action
      t.string :href
      t.integer :duration
    end

    create_table :notifications_users do |t|
      t.references :notification
      t.references :user
      t.datetime :acknowledged_at
    end
  end
end
