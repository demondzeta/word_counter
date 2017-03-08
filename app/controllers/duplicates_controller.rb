class DuplicatesController < ApplicationController
  include ApiTokenable  

  def index
    update_counter
    render json: [ code: "200", status:  :success, duplicates: duplicates(params[:data]) ], root: false
  end

  def update_counter
    @ak = ApiKey.find_by_api_key(params[:api_key])
    @ak.update(times_used: (@ak.times_used + 1))
  end

  def duplicates(data)
    return  [] if !data
    dups = {}
    data.each_with_index { |val, idx| (dups[val] ||= []) << idx }
    dups.delete_if {|k,v| v.size == 1}
    dups.map { |k, v| { word: k, positions: v } }
  end
end
