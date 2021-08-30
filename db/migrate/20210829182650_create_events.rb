class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :event_type
      t.text :description
      t.references :church_annex, null: false, foreign_key: true
      t.integer :offering
      t.datetime :date

      t.timestamps
    end
  end
end
