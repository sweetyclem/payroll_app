Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :payroll_reports do
    collection do
      post :import
      get 'index'
    end
  end
  
  resources :payroll_data do
    collection do
      post :import
    end
    get 'index'
  end

  root to: 'welcome#index'
end
