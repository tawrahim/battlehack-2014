class RafflesController < ApplicationController
  def index
    @rafles = Raffle.all
  end

  def edit
  end
end
