class CreateUsersTable < ActiveRecord::Migration
def up
create_table :users do |t|
t.string :email
t.string :username
t.string :password
t.integer :followed_id
t.integer :follower_id
t.datetime :created_at
t.datetime :updated_at
end

create_table :posts do |p|
	p.integer :user_id
	p.string  :category
	p.text    :content
	p.datetime :created_at
	p.datetime :updated_at
end



create_table :followers do |p|

p.integer :user_id
p.integer :self
p.datetime :created_at
p.datetime :updated_at
end

create_table :samples do |s|

	s.string :list
	s.integer :user_id
	s.datetime :created_at
   s.datetime :updated_at
end



end
def down
drop_table :users
drop_table :posts
drop_table :followers
drop_table :samples
end
end