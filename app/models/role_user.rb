class RoleUser
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :role
  belongs_to :user
end
