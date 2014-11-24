class AddDisponibleToUsuario < ActiveRecord::Migration
  def change
  		add_column :usuarios, :disponible, :boolean, default: true
  end
end
