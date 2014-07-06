require './torch_answer.rb'

describe Torch do 
	before (:each) do
		@quest = Torch.new
	end

	# it "should list people as numbers" do 
	# 	expect(@quest.pairs).to eq([6,1,3,12,8])
	# end# remove this test
	#test not finished

	it "should remove two pairs at a time" do
		expect(@quest.pairs)
	end


end