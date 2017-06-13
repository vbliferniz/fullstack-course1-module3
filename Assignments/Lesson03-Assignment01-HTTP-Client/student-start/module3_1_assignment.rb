require 'httparty'
require 'pp'

class Recipe
	include HTTParty

	base_uri 'http://food2fork.com/api'
	default_params({key: ENV["FOOD2FORK_KEY"]})
	format :json

	def self.for(search_term = '')
		get('/search', query: { q: search_term})['recipes']
	end
end

pp Recipe.for 'Chocolate'