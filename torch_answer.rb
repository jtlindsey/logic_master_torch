class Torch
	attr_accessor :time_left, :left_group, :right_group

	def initialize(time_left=30)
		@time_left = time_left
		@left_group = [1,3,6,8,12]#[12,8,6,3,1] #[6,1,3,12,8]
		@right_group = []
		@stop = false
		@attemps = 0
	end

	def random_index_pos(left_group)
		random = 0
		until left_group.include?(random)
			random = rand(1..12)
		end
		random
	end

	def random_go_back(right_group)
		random = 0
		until right_group.include?(random)
			random = rand(1..12)
		end
		random
	end

	def pairs
		while @stop == false

			@attemps += 1
			 if @attemps >= 5000000
			 	@stop = true
			 end

			puts "enter loop peoples total #{@left_group.count}, who #{@left_group}"#
			uz1 = Torch.new
			runner_a = uz1.random_index_pos(@left_group)
			@right_group << runner_a #add to right group totals
			@left_group.delete(runner_a)
			puts "1st people array edit new total #{@left_group.count}, who #{@left_group}"#remove...............

			uz2 = Torch.new
			runner_b = uz2.random_index_pos(@left_group)
			@right_group << runner_b #add to right group totals
			@left_group.delete(runner_b)
			puts "2nd people array edit new total #{@left_group.count}, who #{@left_group}"#remove...............

			#cross bridge and adjust time
			runner_a > runner_b ? @time_left = @time_left - runner_a : @time_left = @time_left - runner_b

			#check for cracked code before going back
			if @time_left >= 0 && @right_group.count == 5
				puts "*******************"
				puts "Code Cracked!"
				puts "Attemps before success = #{@attemps}"
				puts "People array #{@left_group.count}"
				puts "People in right group #{@right_group.count}, time left #{@time_left}"
				puts "*******************"
				@stop = true
			end

			if @stop == false

				puts "******runner A #{runner_a}, B #{runner_b}, time left #{@time_left}*****"
				puts "before edit right group count #{@right_group.count}"#remove...............
				puts "time left #{@time_left}"#remove...............

				uz3 = Torch.new
				runner_goback = uz3.random_go_back(@right_group)#1 of 2 runners on right go back to left
				@right_group.delete(runner_goback) #remove from right group totals
				@left_group << runner_goback #runner go back to group
				@time_left = @time_left - runner_goback #take runner time off clock
				puts "*******gobacker******** #{runner_goback}"

			if @time_left < 0
				puts "************************game is resetting*****************"	
				@time_left = 30 #reset clock
				@left_group = [1,3,6,8,12] #reset people on left
				@right_group = []# right group equal zero					
			end

			end
		end
	end
end


	puts "Hello, press x to start, or any other key to exit"
	response = gets.chomp

	case response
	when "x"
		query = Torch.new
		query.pairs
	else
		puts "Goodbye"
	end