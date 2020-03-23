Rails.application.routes.draw do
  root 'daily_reports#compare'
  get 'daily_reports/compare'
  resources :daily_reports
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
