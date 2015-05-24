Rails.application.routes.draw do
  resources :rooms
  post '/find_room' => 'welcome#find_room'
  post '/rooms/:id' => 'rooms#select_answer', defaults: {format: :js}
  root 'welcome#index'
end
