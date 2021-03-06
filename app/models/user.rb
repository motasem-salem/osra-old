class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :database_authenticatable,
         :rememberable, :trackable, :lockable, :timeoutable

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'

  ## Database authenticatable
  field :name, :type => String, :default => ""
  field :username, :type => String, :default => ""
#  field :email, :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  ## Recoverable
#  field :reset_password_token, :type => String
#  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count, :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at, :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip, :type => String

  ## Lockable
  field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  field :unlock_token, :type => String # Only if unlock strategy is :email or :both
  field :locked_at, :type => Time

  has_and_belongs_to_many :roles

  def role?(role)
    return false if role.nil?
    return !!self.roles.where(name: role.to_s.camelize).first
  end

end
