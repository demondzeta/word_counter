class ApiKeyGenerator
  def initialize(api_key)
    @api_key = api_key
  end
  def generate
    #return if @api_key.secret_token.present?
    @api_key.api_key = key_string
  end

  def key_string
      Digest::MD5.new.hexdigest @api_key.mail
  end

end
