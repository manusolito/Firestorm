class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
<<<<<<< HEAD:Bestnid/db/migrate/20141101185317_create_productos.rb
      t.string :descripcion
      t.string :vencimiento

      t.timestamps
=======
      t.string :prourl
      t.text :descripcion
      t.date :vencimiento
	  
	  t.timestamps
>>>>>>> origin/categorias:Bestnid/db/migrate/20141110152226_create_productos.rb
    end
  end
end
