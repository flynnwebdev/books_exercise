Rails.application.routes.draw do
  get 'books/index'
  get "/books", to: "books#index"
  get "/books/:id", to: "books#show"
  post "/books", to: "books#create"
  put "/books/:id", to: "books#update"
  delete "/books/:id", to: "books#destroy"
end
