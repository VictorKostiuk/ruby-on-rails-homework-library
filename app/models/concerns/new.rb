# frozen_string_literal: true

module New
  extend ActiveSupport::Concern

  included do
    scope :newest, -> { where("created_at >= ?", Date.today.at_beginning_of_week) }
  end
end
