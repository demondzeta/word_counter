module ApiTokenable
  extend ActiveSupport::Concern

  included do
    skip_before_filter :verify_authenticity_token
    before_action :restrict_access, :get_api_key

  end

  protected

  def token_params
    params.require(:api_key).permit(:api_key)
  end

  def restrict_access
    api_key = ApiKey.find_by_api_key(token_params[:api_key])
    head :unauthorized unless api_key
    return api_key
  end

  def get_api_key
    @api_key = ApiKey.find(restrict_access.id)
  end

end
