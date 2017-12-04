Rails.application.routes.draw do
  
  #get 'contacts/form'削除して以下を設定した
  resource :contacts

  resources :blogs do #rails resourceで作成した7項目に追加する
    collection do #colectionはid指定ではなく全体に使える
      post :confirm
    end
  end
end
  
  #resources :blogs
 #end
