class Blog < ApplicationRecord
  belongs_to :user,optional: true
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  
  validate :add_error_sample
  def add_error_sample
      
    # タイトルが空のときにエラーメッセージを追加する      
     if title.blank?
      errors[:base] << "タイトルが入力されていません！"
    end        
      
    # 投稿が空のときにエラーメッセージを追加する
    if content.blank?
      errors[:base] << "投稿内容が入力されていません！"
    end
    
    # 文字数が条件に合わない時にエラーメッセージを追加する
    if content.length.>140  
      errors[:base] << "140文字を超えています！"
    end
  end
end