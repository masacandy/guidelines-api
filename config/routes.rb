# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :api, defaults: { format: :json } do
    namespace :v1 do
      resources :guidelines, param: :display_id do
        resources :steps, only: %i(create update destroy), param: :display_id
      end
    end
  end
end
