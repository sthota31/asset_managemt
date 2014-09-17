class Role < ActiveRecord::Base
  # attr_accessible :title, :body
  has_and_belongs_to_many :users, :join_table => :roles_users
  belongs_to :resource, :polymorphic => true
  
  scopify
end
