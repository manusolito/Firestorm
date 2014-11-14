class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :url
      t.string :nombre
      t.integer :dni
      t.string :email
      t.column :tarjeta, :bigint
      t.string :contrasenia

      t.timestamps
    end
  end
end
