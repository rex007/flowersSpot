class Api::V1::FlowersController < Api::V1::BaseController
  skip_before_action :authenticate_api_user

  def index
    @flowers = Flower.alphabetical.page(params[:page]).per(params[:per_page])
    render json: @flowers,
      root: :flowers,
      meta: generate_pagination(@flowers),
      each_serializer: FlowersSerializer
  end

  def search
    flowers = Flower.arel_table
    @flowers = Flower.page.where(flowers[:name].matches("%#{params[:query]}%"))
    render json: @flowers,
      root: :flowers,
      meta: generate_pagination(@flowers)
  end
end
