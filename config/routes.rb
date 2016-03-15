Rails.application.routes.draw do

  get '/' => 'recipes#index'
  get '/recipes' => 'recipes#index'
  
  get '/recipes/new' => 'recipes#new'
  post '/recipes' => 'recipes#create'

  get '/recipes/random' => 'recipes#random'
  get '/recipes/:id' => 'recipes#show'

  get '/recipes/:id/edit' => 'recipes#edit'
  patch '/recipes/:id' => 'recipes#update'

  delete '/recipes/:id' => 'recipes#destroy'

  # this is refering to the search bar that is in the application.html.erb file and the search action in controller
  post '/search' => 'recipes#search'
end
