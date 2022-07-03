# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  MIN_BODY_LENGTH = 2
  MAX_BODY_LENGTH = 200

  validates :body, presence: true, length: { minimum: MIN_BODY_LENGTH, maximum: MAX_BODY_LENGTH }

  def formated_date
    created_at.strftime('%d.%m.%Y %H:%M')
  end
end
