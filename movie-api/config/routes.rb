Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/movie-api' do
    namespace :v1 do
      resources :movies, only: %i[index create show update destroy]
    end
  end
end
