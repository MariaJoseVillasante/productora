class CreateCrews < ActiveRecord::Migration[7.0]
  def change
    create_table :crews do |t|
      t.string :nombre
      t.string :mail
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
