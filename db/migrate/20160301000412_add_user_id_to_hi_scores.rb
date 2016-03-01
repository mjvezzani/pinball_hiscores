class AddUserIdToHiScores < ActiveRecord::Migration
  def change
    add_column :hi_scores, :user_id, :integer
  end
end
