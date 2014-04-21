class CreateInvestigationTypes < ActiveRecord::Migration
  def change
    create_table :investigation_types do |t|
      t.string :investigation_type

      t.timestamps
    end
  end
end
