class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :followers, dependent: :destroy
  
end
 
class Post < ActiveRecord::Base
  belongs_to :user
end

class Follower < ActiveRecord::Base
  belongs_to :user
end

class Sample < ActiveRecord::Base

	end