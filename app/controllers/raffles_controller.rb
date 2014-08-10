class RafflesController < ApplicationController
  def index
    @rafles = Raffle.all
  end

  def edit
    if params[:tokens]
       @raffle = Raffle.find(params[:id]) 
       @raffle.bids.create!(user_id: current_user.id, number_of_tokens: params[:tokens].to_i)
    end
  end

  def create
    if user_signed_in?
      @raffle = Raffle.new(raffle_param)
      if @raffle.save
        # redirect them back to main page
        redirect_to root_path
      else
        render 'new'
      end
    else
      redirect_to new_user_session
    end
  end

  def new
    @raffle = Raffle.new
  end

  def show
  end

  private
  # This is to allow mass assignment
  def raffle_param
    params.require(:raffle).permit(:name, :pickup_location, :charity_name,
                                :description,:picture_url,:end_raffle)
  end
end
