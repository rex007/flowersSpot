require 'rails_helper'

RSpec.describe Api::V1::Sightings::LikesController, type: :controller do

  describe 'index' do
	it 'should return likes from sighting' do
      user = create(:user)
      flower = create(:flower)
      sighting = create(:sighting, user: user, flower: flower)
      like1 = create(:like, user: user, sighting: sighting)
      like2 = create(:like, user: user, sighting: sighting)

      request.headers['Authorization'] = user.to_jwt
      get :index, params: {sighting_id: sighting.id}
      expect(response.status).to eq(200)
      results = JSON.load(response.body)
      expect(results['likes'].count).to eq(2)
    end	    
  end

  describe 'create' do
  	it 'should like a sighting' do
  		user = create(:user)
  		sighting = create(:sighting)

   		like_params = {
        	user_id: user.id,
        	sighting_id: sighting.id
      	}

  		request.headers['Authorization'] = user.to_jwt
  		like = sighting.likes.create!(like_params)
  		expect(response.status).to eq(200)
  		results = JSON.load(response.body)
  		expect(sighting.reload.likes.first).to eq(like)
  	end
  end

  describe 'destroy' do
    it 'should unlike sighting' do
      like = create(:like)
      user = like.user

      request.headers['Authorization'] = user.to_jwt
      user.likes << like
      expect(response.status).to eq(200)
    end
  end

end
