require 'net/http'
require 'json'

class Solution
	@@movie_api = URI('https://challenges.hackajob.co/swapi/api/films/')
# 174 API calls are taking about 25 sec each time
    def run(character)
    	numberOfFilms = 0
    	for name in get_character_names
        numberOfFilms += 1 if name == character
    	end
		  numberOfFilms
    end

		private
# Extracts character names from array of URIs and returns array
    def get_character_names
			get_all_character_uris.map { |uri| get_character_name(json(uri)) }
    end

    def get_character_name(json)
      json["name"]
    end
# Takes array of APIs and converts them to URIs
    def get_all_character_uris
			get_all_character_apis.map { |api| uri(api) }
    end
# Makes an array of all character API links
    def get_all_character_apis
			json(@@movie_api)["results"].map { |movie| movie["characters"]}.flatten
    end

    def json(uri)
		  JSON.parse(get_api(uri))
    end

    def get_api(uri)
    	Net::HTTP.get(uri)
    end

    def uri(api)
    	URI(api)
    end
end
