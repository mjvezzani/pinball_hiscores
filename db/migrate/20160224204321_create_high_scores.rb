class CreateHighScores < ActiveRecord::Migration
  def change
    create_table :high_scores do |t|
      t.integer :table_id
      t.integer :score

      t.timestamps
    end
  end
end
