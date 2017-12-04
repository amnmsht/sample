class Blog < ApplicationRecord
    validates :title, presence: true,length: { in: 1..140 } 
    validates :content, presence: true,length: { in: 1..140 }
    #validates :title, presence: true
end
