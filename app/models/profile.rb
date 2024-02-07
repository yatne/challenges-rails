class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar

  validate :acceptable_image

  def acceptable_image
    return unless avatar.attached?

    unless avatar.blob.byte_size <= 1.megabyte
      errors.add(:avatar, "is too big")
    end

    unless /image\/.+/.match?(avatar.content_type)
      errors.add(:avatar, "must be an image")
    end
  end
end
