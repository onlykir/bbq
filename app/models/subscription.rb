class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validate :event_of_subscriber?
  validates :event, presence: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, unless: -> { user.present? }

  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id},
    exclusion: { in: User.pluck(:email), message: I18n.t('global.error.email_exists') },
    unless: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def event_of_subscriber?
    if event.user == user
      errors.add(:event, I18n.t('global.error.event_of_subscriber'))
    end
  end

end
