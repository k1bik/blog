# frozen_string_literal: true

class Question < ApplicationRecord
  MIN_TITLE_LENGTH = 2
  MAX_TITLE_LENGTH = 40
  MIN_BODY_LENGTH = 2
  MAX_BODY_LENGTH = 200

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 2 }
end
