class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :challenges
  has_many :challenge_participations, dependent: :destroy
  has_many :participations, class_name: "Challenge", through: :challenge_participations
end
