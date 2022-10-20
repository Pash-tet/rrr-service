FactoryBot.define do
  factory :params_remapping do
    route
    initial_key { "initial_key" }
    initial_value { "initial_value" }
    remapped_key { "remapped_key" }
    remapped_value { "remapped_value" }
  end
end
