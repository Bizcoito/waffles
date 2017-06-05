Rails.application.routes.draw do
  get '/books', to: 'books#index'
  post '/books', to: 'books#create'
end
