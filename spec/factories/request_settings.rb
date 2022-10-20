FactoryBot.define do
  factory :request_setting do
    key { "url" }
    value { "https://example.com" }
    interpolated { false }
  end
end
