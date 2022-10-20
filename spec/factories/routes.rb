FactoryBot.define do
  factory :route do
    service_path { "users/123ffas123/season/123/claim" }
    service_http_method { "post" }
    request_http_method { "post" }
    remote_method { "try_this" }
    disabled { false }
  end
end
