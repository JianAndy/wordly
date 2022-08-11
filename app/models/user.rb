class User < ApplicationRecord
    has_many :games

   # validates :username, presence: true, length: { minimum: 2 }

end
