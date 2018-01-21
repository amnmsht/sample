Rails.application.routes.draw do
    if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end
  
    #resource :contacts
  
    root 'blogs#top'
    resources :blogs do
    collection do
    post :confirm

    resources :users,only: [:new,:create,:show,:edit,:update]
    resources :sessions,only:[:new,:create,:destroy]
    resources :favorites, only: [:create, :destroy]
     
    end
  end
end