# Rails.application.configure do
#   config.lograge.enabled = Rails.application.credentials[:lograge_enabled]
#   config.lograge.custom_options = lambda do |event|
#     exceptions = %w[controller action format id]
#     {
#       params: event.payload[:params].except(*exceptions)
#     }
#   end
# end
