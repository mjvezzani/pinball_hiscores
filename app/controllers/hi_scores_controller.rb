class HiScoresController < ApplicationController
  def create
    @pin = Pin.find(params[:pin_id])
    @hi_score = @pin.hi_scores.build(hi_score_params)

    if @hi_score.save
      flash[:success] = "High score saved!"
      redirect_to pin_path(@hi_score.table)
    else
      flash[:error] = "An error occurred"
      redirect_to pin_path(@hi_score.table)
    end
  end

  private

  def hi_score_params
    params.require(:hi_score).permit(:score, :pin_id)
  end
end
