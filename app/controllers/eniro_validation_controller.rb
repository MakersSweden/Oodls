class EniroValidationController < ApplicationController

  def eniro_validation
    query = params[:query]
    ccode = params[:ccode]
    results = EniroApi.new(query, ccode).query.sanitize_api_response.to_json
    render json: results
  end

end