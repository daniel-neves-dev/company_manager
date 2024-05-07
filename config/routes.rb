Rails.application.routes.draw do

  scope "(:locale)", locale: /en|pt-BR/ do

    resources :mains
    resources :employees
    root 'mains#index'
  end
end
