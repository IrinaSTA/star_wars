require 'star_wars'

describe "Solution" do

	solution = Solution.new
  @api = 'https://challenges.hackajob.co/swapi/api/films/'

	it 'can create a uri from api' do
    expect(solution.uri(@api)).to be_an_instance_of(Uri)
  end
end
