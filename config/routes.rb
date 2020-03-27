Rails.application.routes.draw do
  get '/professors', to: 'professors#index'
  get '/professors/:professor_id', to: 'professors#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
