class Role < ApplicationRecord
      #user = User.find(1)
      ## For adding role
      #user.add_role :admin
      ## For checking whether a user has some role
      #user.has_role? :admin
      ## For removing role from a user
      #user.remove_role :admin
  has_and_belongs_to_many :users, :join_table => :users_roles

  belongs_to :resource,
             :polymorphic => true,
             :optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
end
