Rails.application.routes.draw do
	root 'static_pages#home'

	resources :doctors
	resources :patients
	resources :appointments, only: [:new, :create, :destroy]

end