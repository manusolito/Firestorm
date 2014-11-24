class AddOfertaGanadoraIdToProducto < ActiveRecord::Migration
  def change
  	add_column :productos, :ofertagano_id, :integer
  end
end
