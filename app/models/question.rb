# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  MIN_TITLE_LENGTH = 2
  MAX_TITLE_LENGTH = 40
  MIN_BODY_LENGTH = 2
  MAX_BODY_LENGTH = 200

  validates :title, presence: true, length: { minimum: MIN_TITLE_LENGTH, maximum: MAX_TITLE_LENGTH }
  validates :body, presence: true, length: { minimum: MIN_BODY_LENGTH, maximum: MAX_BODY_LENGTH }

  scope :today, -> { where(created_at: Time.zone.now.at_beginning_of_day...Time.zone.now) }
  scope :past_week, -> { where(created_at: Time.zone.now.at_beginning_of_week...Time.zone.now.at_end_of_week) }

  def formated_date
    created_at.strftime('%d.%m.%Y %H:%M')
  end
end
