Rails.application.routes.draw do
  scope "(:locale)", locale: /en|pt-BR/ do
    resources :statics
    resources :employees

    root to: "statics#index"

    get "up" => "rails/health#show", as: :rails_health_check
  end
end
