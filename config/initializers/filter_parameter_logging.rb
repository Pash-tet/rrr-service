Rails.application.config.filter_parameters += [
  :passw, :secret, :token, :api_key, :crypt, :salt, :certificate, :otp, :ssn
]
