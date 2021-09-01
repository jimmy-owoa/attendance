class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.datetime :admin_at
      t.datetime :deleted_at
      t.references :user, null: false, foreign_key: true
      t.references :church_annex, null: false, foreign_key: true

      t.timestamps
    end
  end
end
