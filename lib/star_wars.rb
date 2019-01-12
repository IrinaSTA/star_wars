require 'net/http'
require 'json'
require 'pry'

class Solution

	@@movie_api = URI('https://challenges.hackajob.co/swapi/api/films/')

    def run(character)
    	numberOfFilms = 0
    	for name in get_character_names
        numberOfFilms += 1 if name == character
    	end
		  numberOfFilms
    end

    def found?(character, movie_title)
    	!movie_title.scan(/#{character}/).empty?
    end

    def get_character_names
    	names = []
    	for uri in get_all_character_uris do
    		names << get_character_name(get_json(uri))
        p names
    	end
    	names
    end

    def get_character_name(json)
      json["name"]
    end

    def get_all_character_uris
      all_character_uris = []
      for api in get_all_character_apis
        all_character_uris << uri(api)
      end
      all_character_uris
    end

    def get_all_character_apis
    	all_character_apis = []
    	for movie in get_json(@@movie_api)["results"] do
    		all_character_apis << movie["characters"]
    	end
    	all_character_apis.flatten
    end

    def json(response)
		  JSON.parse(get_api(response))
    end

    def get_api(uri)
    	Net::HTTP.get(uri)
    end

    def uri(api)
    	URI(api)
    end
end
