class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :phone
      t.string :stripe_acc_type
      t.string :addr1
      t.string :city
      t.string :state
      t.integer :dob_day
      t.integer :dob_month
      t.integer :dob_year
      t.integer :ssn_l4
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
