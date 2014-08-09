class Raffle < ActiveRecord::Base
	has_many :bids
end
