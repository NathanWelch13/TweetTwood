git clone git@heroku.com:tweet-twoot.git -o heroku
require 'sinatra'
require './twitter'
require 'pat'


set :server, 'thin'

TwitterSearch.setup

get '/' do
	search = params['search']
	@tweets = TwitterSearch.search(search)
	erb :index
end
