Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :doctors
      resources :patients
      resources :appointments
    end
  end
end
