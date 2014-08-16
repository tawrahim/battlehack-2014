class AddLocationFieldsToRaffle < ActiveRecord::Migration
  def change
  	add_column :raffles, :latitude, :float
    add_column :raffles, :longitude, :float
  end
end
