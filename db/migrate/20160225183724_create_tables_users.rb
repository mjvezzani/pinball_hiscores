class CreateTablesUsers < ActiveRecord::Migration
  def change
    create_table :tables_users do |t|
      t.integer :user_id, index: true
      t.integer :table_id, index: true

      t.timestamps
    end
  end
end
