class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.integer :dni
      t.string :email
      t.integer :tarjeta
      t.string :contrasenia

      t.timestamps
    end
  end
end
