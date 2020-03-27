Rails.application.routes.draw do
# professors
  get '/professors', to: 'professors#index'
  get '/professors/:professor_id', to: 'professors#show'
# students
  get '/students', to: 'students#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
