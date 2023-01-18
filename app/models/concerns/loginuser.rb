class Loginuser < ApplicationRecord
    has_secure_password
    validates :username, :password, :email, presence: true
end

