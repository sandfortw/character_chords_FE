require 'rails_helper'

RSpec.describe 'Home Page', type: :feature do

  before do
    visit root_path
  end

  describe 'Link to Log in' do
    context "when successful" do

      it "When clicked, we are taken to the login page with a welcome message (happy path)" do
        login_with_oauth
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Welcome, Test User")
      end
    end 
    
    context "when NOT successful" do
      it 'when clicked, we are taken to the login page (sad path)' do
        click_on('Sign in with Spotify')
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Spotify Login Failed")
      end
    end 
  end
end