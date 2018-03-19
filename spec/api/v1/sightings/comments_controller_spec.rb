require 'rails_helper'

RSpec.describe Api::V1::Sightings::CommentsController, type: :controller do

  describe 'index' do
    it 'should return comments for sightings' do
      user = create(:user)
      flower = create(:flower)
      sighting = create(:sighting, user: user, flower: flower)
      comment1 = create(:comment, user: user, sighting: sighting)
      comment2 = create(:comment, user: user, sighting: sighting)

      request.headers['Authorization'] = user.to_jwt
      get :index, params: {sighting_id: sighting.id}
      expect(response.status).to eq(200)
      results = JSON.load(response.body)
      expect(results['comments'].count).to eq(2)
    end
  end




  describe 'create' do
  	it 'comment for sighting' do
      user = create(:user)
      sighting = create(:sighting)
      
      comment_params = {
        user_id: user.id,
        sighting_id: sighting.id,
        body: 'Lorem ipsom'
      }

      request.headers['Authorization'] = user.to_jwt
      comment = sighting.comments.create!(comment_params)
      expect(response.status).to eq(200)
      result = JSON.load(response.body)
      expect(sighting.reload.comments.first).to eq(comment)
  	end
  end

  describe 'destroy' do
    it 'should destroy comment' do
      comment = create(:comment)
      user = comment.user

      request.headers['Authorization'] = user.to_jwt
      user.comments << comment
      expect(response.status).to eq(200)
    end
  end

end






