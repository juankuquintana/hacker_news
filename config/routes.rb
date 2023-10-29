Rails.application.routes.draw do
  root "stories#index"

  resources :stories, only: [:index, :show] do
    collection do
      get 'refresh'
    end
  end

  get '*path' => 'stories#index'
end
