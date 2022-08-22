# frozen_string_literal: true

RSpec.describe Book, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :author }

  it { is_expected.to have_many :orders }
  it { is_expected.to have_many :comments }

  it { is_expected.to have_one_attached(:image) }
end
