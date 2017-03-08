class DuplicatesController < ApplicationController
  include ApiTokenable

  def index
    ApiKey.update_counter(params[:api_key])
    duplicate_builder = DuplicatesBuilder.new(params[:data])
    render json: [
                  code: "200", status:  :success, 
                  duplicates: duplicate_builder.build ], root: false
  end
end
