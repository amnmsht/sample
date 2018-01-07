Rails.application.routes.draw do

  resource :contacts
  
  #root 'blogs#index'#(12/14までの設定）このルーティングを設定すると'/'が呼ばれるとindexに遷移させていた
  
  root 'blogs#top'#（12/15からの設定）このルーティングを設定すると'/'が呼ばれるとtopに遷移させる 
  resources :blogs do #rails resourceで作成した7項目に追加する
    collection do #colectionはid指定ではなく全体に使える
    post :confirm
    
     resources :users,only: [:new,:create,:show]
     resources :sessions,only:[:new,:create,:destroy]
     resources :favorites, only: [:create, :destroy]
    end
  end
end
  
 
