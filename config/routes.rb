Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :payroll_reports do
    collection do
      post :import
      get 'show'
    end
  end
  
  resources :payroll_data do
    collection do
      post :import
    end
    get 'show'
  end

  root to: 'welcome#index'
end
