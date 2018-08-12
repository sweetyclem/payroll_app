Rails.application.routes.draw do
  resources :work_logs do
    collection do
      post :import
    end
  end
  
  get '/display/:upload_number', to: 'reports#display'

  root to: 'welcome#index'
end
