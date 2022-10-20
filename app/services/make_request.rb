class MakeRequest
  def self.call(url:, request_method:, body:)
    headers = RequestSetting.find_by(key: "request_headers")
    headers = JSON.parse(headers.value) if headers.present?
    additional_request_params = RequestSetting.find_by(key: "additional_request_params")

    body = body.merge(JSON.parse(additional_request_params.value)) if additional_request_params.present?

    resp = Faraday.new(url: url, headers: headers).public_send(request_method) do |req|
      req.body = body
    end

    JSON.parse(resp.body)
  end
end
