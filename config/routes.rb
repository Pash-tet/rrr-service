Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "ping", to: "application#ping"
  match "*path", to: "application#run", via: %i[get put post delete]
end
