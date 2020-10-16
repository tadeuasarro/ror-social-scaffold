require 'rails_helper'

RSpec.describe 'Friendship features', type: :request do
  scenario 'Create and accept new friendship' do
    visit new_user_registration_path
    fill_in 'user_name', with: 'tadeu'
    fill_in 'user_email', with: 'tadeu@tadeu.com'
    fill_in 'user_password', with: '123123'
    fill_in 'user_password_confirmation', with: '123123'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')

    click_link 'Sign out'
    expect(page).to have_content('You need to sign in or sign up before continuing.')

    visit new_user_registration_path
    fill_in 'user_name', with: 'maria'
    fill_in 'user_email', with: 'maria@maria.com'
    fill_in 'user_password', with: '123123'
    fill_in 'user_password_confirmation', with: '123123'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')

    visit users_path
    click_link 'Add friend'
    expect(page).to have_content('Friendship request sent!')

    click_link 'Sign out'
    expect(page).to have_content('You need to sign in or sign up before continuing.')

    visit new_user_session_path
    fill_in 'user_email', with: 'tadeu@tadeu.com'
    fill_in 'user_password', with: '123123'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')

    visit friendships_path
    click_link 'Accept friend'
    expect(page).to have_content('Friendship request accepted!')
  end

  scenario 'Create and reject new friendship' do
    visit new_user_registration_path
    fill_in 'user_name', with: 'tadeu'
    fill_in 'user_email', with: 'tadeu@tadeu.com'
    fill_in 'user_password', with: '123123'
    fill_in 'user_password_confirmation', with: '123123'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')

    click_link 'Sign out'
    expect(page).to have_content('You need to sign in or sign up before continuing.')

    visit new_user_registration_path
    fill_in 'user_name', with: 'maria'
    fill_in 'user_email', with: 'maria@maria.com'
    fill_in 'user_password', with: '123123'
    fill_in 'user_password_confirmation', with: '123123'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')

    visit users_path
    click_link 'Add friend'
    expect(page).to have_content('Friendship request sent!')

    click_link 'Sign out'
    expect(page).to have_content('You need to sign in or sign up before continuing.')

    visit new_user_session_path
    fill_in 'user_email', with: 'tadeu@tadeu.com'
    fill_in 'user_password', with: '123123'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')

    visit friendships_path
    click_link 'Reject request'
    expect(page).to have_content('Request rejected!')
  end

end