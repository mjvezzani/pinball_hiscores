class HighScoresController < ApplicationController
  def create
    @table = Table.find(params[:table_id])
    @high_score = @table.high_scores.build(high_score_params)

    if @high_score.save
      flash[:success] = "High score saved!"
      redirect_to table_path(@high_score.table)
    else
      flash[:error] = "An error occurred"
      redirect_to table_path(@high_score.table)
    end
  end

  private

  def high_score_params
    params.require(:high_score).permit(:score, :table_id)
  end
end
