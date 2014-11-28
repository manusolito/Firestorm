class AddDisponibleToCategoria < ActiveRecord::Migration
  def change
  		add_column :categoria, :disponible, :boolean, default: true
  end
end
