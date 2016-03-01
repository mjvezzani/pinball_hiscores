class ChangeHiScoreScoreStringToBigInt < ActiveRecord::Migration
  def up
    change_column :hi_scores, :score, :integer, :limit => 8
  end

  def down
    change_column :hi_scores, :score, :string
  end
end
