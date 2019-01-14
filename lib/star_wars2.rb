require 'net/http'
require 'json'

class SolutionV2

  @@people_api = 'https://challenges.hackajob.co/swapi/api/people/'

  def run(character)
    find_character(character)[0]["films"].count
  end

  private
  
  def find_character(character)
    get_json(@@people_api).each do |character|
      character if character["name"] == character
    end
  end

  def get_json(api)
    JSON.parse(Net::HTTP.get(URI(api)))["results"]
  end

end
