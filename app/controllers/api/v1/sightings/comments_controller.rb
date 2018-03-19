class Api::V1::Sightings::CommentsController < Api::V1::Sightings::BaseController
	before_action :set_sighting, only: [:create, :index, :destroy]

	def index
		@comments = @sighting.comments.order(created_at: :desc)
		render json: @comments
	end

	def create
		@comment = @sighting.comments.new(comment_params)
		@comment.user_id = @current_user.id
		if @comment.save
			render json: @comment
		else
			render json: { error: @comment.errors.full_messages}, status: 400
		end
	end

	def destroy
	    @comment = @current_user.comments.find(params[:id])
	    @comment.destroy
	    render json: @comment
	end


	private

	def set_sighting
		@sighting = Sighting.find(params[:sighting_id])
	end

	def comment_params
		params.require(:comment).permit(:body, :user_id, :sighting_id)
	end
end
