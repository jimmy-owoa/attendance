class CreateChurchAnnexes < ActiveRecord::Migration[6.1]
  def change
    create_table :church_annexes do |t|
      t.string :name
      t.string :address
      t.integer :capacity
      t.datetime :enabled
      t.references :church, null: false, foreign_key: true

      t.timestamps
    end
  end
end
