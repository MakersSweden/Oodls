class EniroValidationController < ApplicationController
 # Usage [host].eniro_validation?query=[query]&ccode=[country code se, no, dk]
  def eniro_validation
    query = params[:query]
    ccode = params[:ccode]
    results = EniroApi.new(query, ccode).query.sanitize_api_response.to_json
    render json: results
  rescue
    render json: {error: 'wrong format', message: 'EniroValidation API does not recognize the request'}
  end

end