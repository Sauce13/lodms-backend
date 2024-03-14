Rails.application.routes.draw do
  resources :courses
  namespace :api do
    namespace :v1 do
      resources :assignments
      resources :users
      resources :program_admins
      resources :departments
      resources :department_level_learning_outcomes
      resources :performance_indicators
      resources :program_level_rubric_items
      resources :course_students
      resources :course_rubric_items
      resources :course_performance_indicator
        
      resources :courses do
        member do
          get 'instructors'
        end
      end
      
      resources :students
      resources :instructors
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    #API routes should be in /api/v1
    # namespace :api do
    #   namespace :v1 do


    #   end
    # end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
