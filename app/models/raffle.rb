class Raffle < ActiveRecord::Base
	require 'sendgrid-ruby'
	require 'twilio-ruby'

	has_many :bids

	def self.check_dates()
		current_date =  Date.today
		Raffle.all.each do |raf|
			if current_date == raf.end_raffle.to_date and raf.done == false
				raf.do_raffle
			end
		end
	end

	def do_raffle()
		self.done = true
		total_tokens = 0
		self.bids.each do |bid|
			total_tokens += bid.number_of_tokens
		end
		chosen_number = rand(total_tokens)
		
		current_token_count = 0
		self.bids.each do |bid|
			if chosen_number < current_token_count + bid.number_of_tokens
				self.update(winner_id:bid.user_id)
				self.send_emails
				return
			end
			current_token_count += bid.number_of_tokens
		end
	end

	def send_emails
		client = SendGrid::Client.new(api_user: 'Raffle', api_key: 'myraffle')
		#email_addr = User.get_email(winner_id)
		email_addr = User.find(winner_id).email
		
		# uncomment
		
		client.send(SendGrid::Mail.new(to: email_addr, from: 'raffle@good.com', 
			subject: 'Contgats!', text: 'Great news, you won!', 
			html: '<b>Great news, you won!</b>'))
		
		losers = self.bids.pluck(:user_id)
		
		losers.delete(self.winner_id)
		if losers.size > 0
			
			losers.each do |loser|
				email_addr = User.find(loser).email

				# uncomment
				client.send(SendGrid::Mail.new(to: email_addr, from: 'raffle@good.com', 
					subject: 'Next time', text: 'This time you didnt win'))
			end
		end

		email_addr = User.find(self.seller_id).email
		# uncomment
		
		client.send(SendGrid::Mail.new(to: email_addr, from: 'raffle@good.com', 
			subject: 'Raffle is over', text: 'Please contact '+ User.find(self.seller_id).email))

		
		 #Get your Account Sid and Auth Token from twilio.com/user/account
		 account_sid = 'ACaa3e215f77dcfcd646a99ecfa7d64121'
		 auth_token = '2962ec88a1178318bede3ef5694ceaac'
		 @client = Twilio::REST::Client.new account_sid, auth_token
		 message = @client.account.messages.create(:body => "The raffle has ended, you have won!",
		 :to => "+16177846015",
		 :from => "+18572632907")
		 puts message.to

	end

end
