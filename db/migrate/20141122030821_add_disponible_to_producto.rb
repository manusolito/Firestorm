class AddDisponibleToProducto < ActiveRecord::Migration
  def change
  	add_column :productos, :disponible, :boolean, default: true
  end
end
