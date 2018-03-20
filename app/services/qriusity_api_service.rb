require 'net/http'
require 'json'


OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

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
			response = Net::HTTP.get(uri)
			res = JSON.parse(response)
			numbers_of_questions = res.count
			randomNumber = rand(0..numbers_of_questions)
			res[randomNumber]['question']
		rescue
			false
		end
	end
end