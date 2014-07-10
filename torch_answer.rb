class Torch

	def initialize
		@left_group = [1,3,6,8,12]
		@right_group = []
		@stop = false
		@attemps = 1
		@time_left = 30
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

			uz1 = Torch.new
			runner_a = uz1.random_index_pos(@left_group)
			@right_group << runner_a #add to right group totals
			@left_group.delete(runner_a)

			uz2 = Torch.new
			runner_b = uz2.random_index_pos(@left_group)
			@right_group << runner_b #add to right group totals
			@left_group.delete(runner_b)

			#cross bridge and adjust time
			runner_a > runner_b ? @time_left = @time_left - runner_a : @time_left = @time_left - runner_b

			#check for cracked code before going back
			if @time_left >= 0 && @right_group.count == 5
				puts "*******************"
				puts "Code Cracked!"
				puts "Total attemps = #{@attemps}"
				puts "People array #{@left_group.count}"
				puts "People in right group #{@right_group.count}, time left #{@time_left}"
				puts "*******************"
				@stop = true
			end

			if @stop == false
				puts "Runner**** #{runner_a}, #{runner_b}"
				uz3 = Torch.new
				runner_goback = uz3.random_go_back(@right_group)#1 of 2 runners on right go back to left
				@right_group.delete(runner_goback) #remove from right group totals
				@left_group << runner_goback #runner go back to group
				@time_left = @time_left - runner_goback #take runner time off clock
				puts "Gobacker**** #{runner_goback}"
				puts "People left #{@left_group}"

			if @time_left < 0
				puts "***************game is resetting***************"
				@attemps += 1 #count attemps to solve level	
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