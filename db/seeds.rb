unless RequestSetting.any?
  [
    {key: "region", value: "europe-central2"},
    {key: "project", value: "runner-bf0eb"},
    {key: "version", value: "0_4"},
    {key: "host", value: "{region}-{project}.cloudfunctions.net"},
    {key: "url", value: "https://{host}/http-{version}_{method}"},
    {key: "request_headers", value: "{\"Content-Type\" => \"application/json\"}"}
  ].each { |s| RequestSetting.create!(key: s[:key], value: s[:value]) }
end

unless Route.any?
  [
    {service_path: "/seasons", service_http_method: "post", remote_method: "open_season", request_http_method: "post"},
    {service_path: "/seasons/:seasonId/status", service_http_method: "post", remote_method: "change_season_status", request_http_method: "post"},
    {service_path: "/seasons/:seasonId/close", service_http_method: "put", remote_method: "close_season", request_http_method: "post"},
    {service_path: "/purchases", service_http_method: "post", remote_method: "purchase_external", request_http_method: "post"},
    {service_path: "/users/:wallet/season/:seasonId/claim", service_http_method: "put", remote_method: "confirm_user_season", request_http_method: "post"}
  ].each { |r| Route.create!(service_path: r[:service_path], service_http_method: r[:service_http_method], remote_method: r[:remote_method], request_http_method: r[:request_http_method]) }
end

if Rails.env.development? && !AdminUser.any?
  AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
end

