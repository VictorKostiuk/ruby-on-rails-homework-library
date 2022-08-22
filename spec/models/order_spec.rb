# frozen_string_literal: true

RSpec.describe Order, type: :model do
  it { is_expected.to belong_to :book }
end
