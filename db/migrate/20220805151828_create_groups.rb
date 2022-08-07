class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :nombre
      t.integer :integrantes
      t.date :fecha_debut
      t.integer :tipo_grupo

      t.timestamps
    end
  end
end
