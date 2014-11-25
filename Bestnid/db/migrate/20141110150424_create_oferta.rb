class CreateOferta < ActiveRecord::Migration
  def change
    create_table :oferta do |t|
      t.text :motivo
      t.float :monto
      t.references :usuario, index: true
      t.references :producto, index: true
      t.timestamps
    end
  end
end
