class AddDoneToRaffles < ActiveRecord::Migration
  def change
  	add_column :raffles, :done, :boolean , default: false
  end
end
