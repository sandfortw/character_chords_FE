require 'rails_helper'


RSpec.describe 'Home Page', type: :feature do

  before do
    visit root_path
  end
  describe 'Link to Log in' do
    it 'when clicked, we are taken to the login page' do
      click_on('Sign in with Spotify')
    end
  end
end