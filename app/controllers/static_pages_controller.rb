class StaticPagesController < ApplicationController
  def dashboard
    @my_pins = current_user.pins
    @common_pins = User.all.map{|x| x.pins}.inject(:&)
  end
end
