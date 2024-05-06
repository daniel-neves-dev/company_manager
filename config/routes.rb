Rails.application.routes.draw do
  scope "(:locale)", locale: /en|pt-BR/ do

    root 'employees#index'
  resources :employees
    get "up" => "rails/health#show", as: :rails_health_check

  end
end
