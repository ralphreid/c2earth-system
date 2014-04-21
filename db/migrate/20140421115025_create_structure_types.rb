class CreateStructureTypes < ActiveRecord::Migration
  def change
    create_table :structure_types do |t|
      t.string :structure_type

      t.timestamps
    end
  end
end
