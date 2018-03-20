require 'net/http'
require 'json'

class QriusityApiService
	def initialize(url = 'https://qriusity.com/v1/questions')
		@url = url
	end

	def call
		get_question
	end

	private

	def get_question
		uri = URI(@url)
		begin
			retries ||= 0
			response = Net::HTTP.get(uri)
			res = JSON.parse(response)
			numbers_of_questions = res.count
			randomNumber = rand(0..numbers_of_questions)
			res[randomNumber]['question']
		rescue
			retry if (retries += 1) < 5
		end
	end
end