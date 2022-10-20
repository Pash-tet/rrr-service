class ApplicationController < ActionController::Base
  wrap_parameters false
  skip_before_action :verify_authenticity_token, only: %i[run ping]

  def run
    if resource_route.present?
      url = ::BuildRequestUrl.call(method: resource_route.remote_method)
      remapped_params = RemapParams.new(route: resource_route, inbound_params: inbound_params).call

      render json: MakeRequest.call(url: url, request_method: resource_route.request_http_method, body: remapped_params)
    else
      render json: {error: "None of the routes matched"}, status: 404
    end
  end

  def ping
    AdminUser.first

    render plain: "pong!"
  end

  private

  def inbound_params
    params_from_path = GetParamsFromPath.call(route: resource_route, path: request.path)

    params.permit!.to_h.except(:action, :controller, :path).merge(params_from_path)
  end

  def resource_route
    @resource_route ||= FindRoute.call(path: request.path, request_method: request.method.downcase)
  end
end
