class Api::V1::ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from ActionController::ParameterMissing, :with => :parameter_missing

  def generate_pagination(paginated_obj)
    # current page, previous page, next page, total pages
    {
      pagination: {
        current_page: paginated_obj.current_page,
        previous_page: paginated_obj.prev_page,
        next_page: paginated_obj.next_page,
        total_pages: paginated_obj.total_pages 
      }
    }
  end

  private

    def record_not_found(error)
      render :json => {:error => error.message}, :status => 404
    end 

    def parameter_missing(error)
      render :json => {:error => error.message}, :status => 400
    end
  
end
