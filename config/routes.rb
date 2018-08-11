Rails.application.routes.draw do
  resources :work_logs do
    collection do
      post :import
    end
  end

  root to: 'welcome#index'
end
