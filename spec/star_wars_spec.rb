require 'star_wars'

describe "Solution" do

	solution = Solution.new

	it 'returns correct number of times \
	that a character appears in Star Wars movies' do
		expect(solution.run("Luke Skywalker")).to eq(5)
	end
end
