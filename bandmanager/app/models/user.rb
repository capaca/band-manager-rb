class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :registerable, 
         :database_authenticatable, 
         #:confirmable, 
         :recoverable,
         :rememberable, 
         :trackable, 
         :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
 
  has_role :default => "user"
end
