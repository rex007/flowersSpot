class JsonWebToken

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
  end

  def self.decode(token)
    body = JWT.decode(token,Rails.application.secrets.secret_key_base,true, algorithm: 'HS256')[0]
    HashWithIndifferentAccess.new body
  rescue JWT::ExpiredSignature
    nil
  end
end
