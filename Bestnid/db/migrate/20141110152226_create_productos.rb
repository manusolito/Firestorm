class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :prourl
      t.text :descripcion
      t.date :vencimiento
      t.references :usuario, index: true
	  
	  t.timestamps
    end
  end
end
