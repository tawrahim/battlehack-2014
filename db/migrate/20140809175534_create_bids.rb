class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :number_of_tokens
      t.integer :raffle_id

      t.timestamps
    end
  end
end
