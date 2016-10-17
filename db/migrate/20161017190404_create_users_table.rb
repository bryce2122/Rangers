class CreateUsersTable < ActiveRecord::Migration
def up
create_table :users do |t|
t.string :email
t.string :usnername
t.string :password
t.datetime :created_at
t.datetime :updated_at
end
end
def down
drop_table :users
end
end