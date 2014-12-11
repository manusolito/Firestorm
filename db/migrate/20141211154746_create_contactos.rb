class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.text :asunto
      t.text :mensaje
      t.references :usuario, index: true
      t.timestamps
    end
  end
end
