class AddNrocomprasToUsuario < ActiveRecord::Migration
  def change
  	add_column :usuarios, :nrocompras, :integer, default: "0"
  end
end
