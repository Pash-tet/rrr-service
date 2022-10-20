class GetParamsFromPath
  def self.call(route:, path:)
    request_path = path.split("/").reject(&:blank?)
    service_path = route.service_path.split("/").reject(&:blank?)

    keys = (service_path - request_path).map { |k| k[1..] }
    values = request_path - service_path

    keys.zip(values).to_h
  end
end
