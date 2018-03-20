class Api::V1::Sightings::LikesController < Api::V1::Sightings::BaseController
	before_action :set_sighting, only: [:index, :create, :destroy]
	skip_before_action :authenticate_api_user, only: :index

	def index
		@likes = @sighting.likes.order(created_at: :desc)
		render json: @likes
	end

	def create
		@like = @sighting.likes.new(like_params)
		@like.user_id = @current_user.id
		if @like.save
			render json: @like
		else
			render json: {error: @like.errors.full_messages}, status: 400
		end
	end

	def destroy
	    @like = @current_user.likes.find(params[:id])
	    @like.destroy
	    render json: @like		
	end


	private

	def set_sighting
		@sighting = Sighting.find(params[:sighting_id])
	end

	def like_params
		params.require(:like).permit(:user_id, :sighting_id)
	end
end
