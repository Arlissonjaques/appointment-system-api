Rails.application.routes.draw do
  get 'dashboard/index'
  scope :api do
    scope :v1 do
      resources :doctors
      resources :patients
      resources :appointments
      resources :dashboard, only: %i[index]
    end
  end
end
