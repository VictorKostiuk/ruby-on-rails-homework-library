# frozen_string_literal: true

require 'support/features_helpers'

RSpec.describe 'User creates a book', driver: :selenium_chrome do
  fixtures :all

  it 'creates book' do
    sign_in
    visit books_path
    create_book

    expect(page).to have_content 'Bip-Bup!'
    expect(page).to have_content 'Bup-Bip!'
    expect(page).to have_content 'ready_for_order'
  end
end
