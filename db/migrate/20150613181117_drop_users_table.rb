class DropUsersTable < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end

    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :user_name,            unique: true
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
