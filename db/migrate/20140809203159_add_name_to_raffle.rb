class AddNameToRaffle < ActiveRecord::Migration
  def change
    add_column :raffles, :name, :string
  end
end
