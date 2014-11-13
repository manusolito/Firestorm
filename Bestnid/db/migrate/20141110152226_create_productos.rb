class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.text :descripcion
      t.date :vencimiento

      t.timestamps
    end
  end
end
