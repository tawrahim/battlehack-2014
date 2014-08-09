class CreateRaffles < ActiveRecord::Migration
  def change
    create_table :raffles do |t|
      t.integer :seller_id
      t.string :picture_url
      t.text :description
      t.string :charity_name
      t.text :pickup_location
      t.integer :winner_id
      t.datetime :end_raffle

      t.timestamps
    end
  end
end
