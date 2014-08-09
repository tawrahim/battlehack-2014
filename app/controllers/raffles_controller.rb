class RafflesController < ApplicationController
  def index
    @rafles = Raffle.all
  end

  def edit
  end

  def create
  end

  def new
    @raffle = Raffle.new
  end
end
