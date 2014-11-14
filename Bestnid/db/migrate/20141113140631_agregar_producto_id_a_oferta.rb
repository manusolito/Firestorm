class AgregarProductoIdAOferta < ActiveRecord::Migration
  def change
  	add_column :oferta, :producto_id, :integer
    add_index :oferta, :producto_id
  end
end
