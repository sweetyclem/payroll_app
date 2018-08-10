Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :payroll_data do
    collection do
      post :import
    end
  end

  root to: 'payroll_data#index'
end
