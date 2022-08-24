# frozen_string_literal: true

module FeatureHelpers
  def sign_up
    visit new_user_registration_path
    fill_in 'Email', with: users(:librarian).email
    fill_in 'Password', with: users(:librarian).encrypted_password
    fill_in 'Password confirmation', with: users(:librarian).encrypted_password
    select 'librarian', from: 'Role'

    click_on 'Sign up', class: 'btn btn-dark mb-3 mt-2'
  end

  def sign_in
    visit new_user_session_path
    fill_in 'Email', with: users(:librarian).email
    fill_in 'Password', with: '123greetings'
    click_on 'Log in', class: 'btn btn-dark'
  end

  def create_book
    click_on 'New book'
    fill_in 'Name', with: 'Bip-Bup!'
    fill_in 'Author', with: 'Bup-Bip!'
    click_on 'Create Book'
  end
end
