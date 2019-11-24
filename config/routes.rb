Rails.application.routes.draw do
  get 'static_pages/helprails'

  get 'static_pages/generate'

  get 'static_pages/controller'

  get 'static_pages/StaticPages'

  get 'static_pages/home'

  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
