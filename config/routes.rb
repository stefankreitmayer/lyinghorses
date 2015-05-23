Rails.application.routes.draw do
  resources :rooms
  post '/find_room' => 'welcome#find_room'
  root 'welcome#index'
end
