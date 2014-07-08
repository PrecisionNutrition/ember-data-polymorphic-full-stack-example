Rails.application.routes.draw do
  resources :triangles

  resources :drawings

  # The shapes
  resources :rectangles
end
