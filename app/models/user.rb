class User < ApplicationRecord
  validates:name, presence:true,length:{maximum:30}
  validates:email,presence:true, length:{maximum:255}
  has_secure_password
  before_validation { email.downcase! }
end
