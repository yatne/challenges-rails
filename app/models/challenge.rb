class Challenge < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :challenge_participations, dependent: :destroy
  has_many :participants, class_name: "User", through: :challenge_participations, source: :user

  validates_uniqueness_of :invite_token

  def all_participants
    [self.creator].concat(self.participants).uniq
  end

  def invite_url
    Rails.application.config.app_url + '/invite/' + self.invite_token
  end
end