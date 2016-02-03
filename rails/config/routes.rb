Rails.application.routes.draw do
  resources :drawings

  # Polymorphic Endpoint
  resources :shapes

  # The shapes
  resources :triangles
  resources :rectangles
end
