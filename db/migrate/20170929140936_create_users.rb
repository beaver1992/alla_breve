class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :login
      t.string :password
      t.string :email
      t.string :phone
      t.string :country_code
      t.datetime :blocked_at
      t.integer :failed_attempt_count
      t.integer :role
      t.datetime :activated_at
      t.datetime :last_login_at
      t.string :last_login_ip
      t.string :reset_password_token
      t.datetime :reset_passwrd_sent_at
      t.integer :sign_in_count
      t.string :current_sign_in_ip
      t.string :auth_token

      t.timestamps
    end
  end
end
