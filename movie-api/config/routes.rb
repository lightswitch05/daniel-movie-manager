Rails.application.routes.draw do

  scope '/movie-api' do
    namespace :v1 do
      resources :movies, only: %i[index create show update destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
