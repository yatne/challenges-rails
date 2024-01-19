class Challenge < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :challenge_participations, dependent: :destroy
  has_many :participants, class_name: "User", through: :challenge_participations, source: :user

  validates_uniqueness_of :invite_token
end