class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :lastname
      t.string :email, null: false
      t.string :password_digest
      t.string :phone
      t.string :legal_number
      t.datetime :enabled
      
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
