Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :api do
  	resources :difficulties
    resources :dish_typies
  	resources :date_deliveries
  	resources :ingredients
  	resources :whatneeds
  	resources :howtocooks
  	resources :nutritions
  	resources :products do
      resources :ingredients, controller: 'product_ingredients'
      resources :whatneeds, controller: 'product_whatneeds'
      resources :nutritions, controller: 'product_nutritions'

    end
  end
  
end
