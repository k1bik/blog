# frozen_string_literal: true

class Question < ApplicationRecord
  MIN_TITLE_LENGTH = 2
  MAX_TITLE_LENGTH = 40
  MIN_BODY_LENGTH = 2
  MAX_BODY_LENGTH = 200

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 2 }

  scope :today, -> { where(created_at: Time.zone.now.at_beginning_of_day...Time.zone.now) }
  scope :past_week, -> { where(created_at: Time.zone.now.at_beginning_of_week...Time.zone.now.at_end_of_week) }
end
