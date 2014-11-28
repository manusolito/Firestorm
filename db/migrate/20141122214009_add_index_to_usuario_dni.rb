class AddIndexToUsuarioDni < ActiveRecord::Migration
  def change
      add_index :usuarios, :dni, unique: true
  end
end
