class RafflesController < ApplicationController
  def index
    if params[:search]
      @raffles = Raffle.find(:all, :conditions => ['name LIKE ? OR description LIKE ?',
       "%#{params[:search]}%", "%#{params[:search]}%"])
    else
      @raffles = Raffle.all
    end

    @hash = Gmaps4rails.build_markers(@raffles) do |raffle, marker|
      if raffle.latitude
         marker.lat raffle.latitude 
         marker.lng raffle.longitude 
      else # fallback
          marker.lat 0
          marker.lng 0
      end
    end
  end

  def update
     @raffle = Raffle.find(params[:id]) 
     if @raffle.update_attributes(raffle_param)
       flash[:success] = "Profile has been succesfully updated!"
       redirect_to root_path
     else
       render 'edit'
     end
  end

  def edit
       @raffle = Raffle.find(params[:id]) 
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
    params.require(:raffle).permit(:picture,:name, :pickup_location, :charity_name,
                                :description,:end_raffle)
  end
end
