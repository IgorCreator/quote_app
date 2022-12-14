class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
