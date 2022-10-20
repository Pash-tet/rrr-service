class FindRoute
  def self.call(path:, request_method:)
    result = Route.active.find_by(service_path: path, service_http_method: request_method)
    return result if result.present?

    request_path = path.split("/").reject(&:blank?)

    Route.active.where(service_http_method: request_method).find_each do |route|
      route_path = route.service_path.split("/").reject(&:blank?)
      params_keys = route_path - request_path

      return route if params_keys.all? { |k| k.first == ":" }
    end
  end
end
