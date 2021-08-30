class CreateAssistants < ActiveRecord::Migration[6.1]
  def change
    create_table :assistants do |t|
      t.references :event, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.float :temperature

      t.timestamps
    end
  end
end
