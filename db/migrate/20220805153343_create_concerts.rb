class CreateConcerts < ActiveRecord::Migration[7.0]
  def change
    create_table :concerts do |t|
      t.datetime :fecha
      t.integer :asistentes
      t.string :lugar
      t.integer :duracion
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
