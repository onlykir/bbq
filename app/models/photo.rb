class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event, presence: true
  validates :user, presence: true
  validates :photo, presence: true
  validate :photo_of_subscriber?

  mount_uploader :photo, PhotoUploader

  scope :persisted, -> { where "id IS NOT NULL"}

  def photo_of_subscriber?
    unless (event.subscribers.exists?(id: user)) || (event.user == user)
      errors.add(:user, I18n.t('global.error.photo_of_subscribers'))
    end
  end

end
