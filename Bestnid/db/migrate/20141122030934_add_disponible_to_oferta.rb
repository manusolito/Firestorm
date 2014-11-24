class AddDisponibleToOferta < ActiveRecord::Migration
  def change
  		add_column :oferta, :disponible, :boolean, default: true
  end
end
