Rails.application.routes.draw do
  resources :rooms, param: :name
  post '/find_room' => 'welcome#find_room'
  post '/rooms/:name' => 'rooms#select_answer', defaults: {format: :js}
  get '/rooms/:name/get_feedback' => 'rooms#get_feedback'
  root 'welcome#index'
end
