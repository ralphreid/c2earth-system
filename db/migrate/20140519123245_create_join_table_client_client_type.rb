class CreateJoinTableClientClientType < ActiveRecord::Migration
  def change
    create_table :client_types_clients, id: false do |t|
      t.integer :client_id
      t.integer :client_type_id
    end
  end
end
