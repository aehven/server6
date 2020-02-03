class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table(:users) do |t|
      t.string :password_digest, :null => false, :default => ""

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :image
      t.string :email
      t.integer :role, default: 100
      t.datetime :tac_agreed_at
      t.string :unsubscribe_token
      t.datetime :unsubscribed_at

      t.timestamps
    end

    add_index :users, :email,                unique: true
  end
end
