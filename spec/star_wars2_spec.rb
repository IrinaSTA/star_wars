require 'star_wars2'

describe "SolutionV2" do

	let (:solution) { SolutionV2.new }

  it 'returns correct number of times \
	that a character appears in Star Wars movies' do
		expect(solution.run("Luke Skywalker")).to eq(5)
	end
end
