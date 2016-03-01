class ChangeHiScoreScoreFromIntegerToString < ActiveRecord::Migration
  def change
    change_column :hi_scores, :score, :string
  end
end
