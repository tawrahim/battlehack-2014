class Raffle < ActiveRecord::Base
	has_many :bids

	def do_raffle()
		total_tokens = 0
		self.bids.each do |bid|
			total_tokens += bid.number_of_tokens
		end
		chosen_number = rand(total_tokens)
		
		current_token_count = 0
		self.bids.each do |bid|
			if chosen_number < current_token_count + bid.number_of_tokens
				self.update(winner_id:bid.user_id)
				return
			end
			current_token_count += bid.number_of_tokens
		end
	end
end
