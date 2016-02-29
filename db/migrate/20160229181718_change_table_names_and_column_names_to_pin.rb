class ChangeTableNamesAndColumnNamesToPin < ActiveRecord::Migration
  def up
    rename_column :high_scores, :table_id, :pin_id
    rename_column :tables_users, :table_id, :pin_id
    rename_table :high_scores, :hi_scores
    rename_table :tables, :pins
    rename_table :tables_users, :pins_users
  end

  def down
    rename_column :hi_scores, :pin_id, :table_id
    rename_column :pins_users, :pin_id, :table_id
    rename_table :hi_scores, :high_scores
    rename_table :pins, :tables
    rename_table :pins_users, :tables_users
  end
end
