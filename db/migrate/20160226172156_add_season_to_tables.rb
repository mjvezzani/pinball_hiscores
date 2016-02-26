class AddSeasonToTables < ActiveRecord::Migration
  def change
    add_column :tables, :season, :integer
  end
end
