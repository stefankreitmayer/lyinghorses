Rails.application.routes.draw do
  resources :rooms
  post '/find_room' => 'welcome#find_room'
  post '/rooms/:id' => 'rooms#select_answer', defaults: {format: :js}
  get '/rooms/:id/get_feedback' => 'rooms#get_feedback'
  root 'welcome#index'
end
