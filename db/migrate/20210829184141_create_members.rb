class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :legal_number
      t.datetime :enabled
      t.references :church, null: false, foreign_key: true
      t.references :church_annex, null: false, foreign_key: true

      t.timestamps
    end
    add_index :members, :legal_number
  end
end
