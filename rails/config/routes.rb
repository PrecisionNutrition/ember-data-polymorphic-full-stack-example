Rails.application.routes.draw do
  resources :drawings

  # The shapes
  resources :rectangles
end
