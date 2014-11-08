class CreateOferta < ActiveRecord::Migration
  def change
    create_table :oferta do |t|
      t.string :motivo
      t.integer :monto

      t.timestamps
    end
  end
end
