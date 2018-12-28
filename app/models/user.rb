class User < ApplicationRecord
  # Encrypts password. Adds methods to authenticate against a bcrypt password.
  has_secure_password

  validates_presence_of :first, :last, :email, :password_digest
end
