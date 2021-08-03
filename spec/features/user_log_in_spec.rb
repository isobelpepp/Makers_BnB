require_relative '../helpers/web_helpers.rb'

feature 'Log in' do
  scenario 'user can log in' do
    sign_up
    click_button('Log Out')
    log_in
    expect(current_path).to eq('/listings')
    expect(page).to have_content 'Welcome Test!'
  end
  scenario 'user cannot log in with wrong email' do
    sign_up
    click_button('Log Out')
    visit('/log_in')
    fill_in('email', with: 'wrongtest@example.com')
    fill_in('password', with: 'Password1!')
    click_button('Log In')
    expect(current_path).to eq('/log_in')
    expect(page).to have_content "Your email and password don't match"
  end
  scenario 'user cannot log in with wrong password' do
    sign_up
    click_button('Log Out')
    visit('/log_in')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'wrongPassword1!')
    click_button('Log In')
    expect(current_path).to eq('/log_in')
    expect(page).to have_content "Your email and password don't match"
  end
  # scenario "doesn't let user sign in if someone is logged in" do
  #   sign_up
  #   log_in
  #   log_in
  #   expect(page).to have_content('Please log out before you can log back in')
  # end
end
