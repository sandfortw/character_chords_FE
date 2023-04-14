require 'rails_helper'

RSpec.describe 'Home Page', type: :feature do

  before do
    visit root_path
  end
  
  context "visiting the home page", :vcr do
    describe 'Link to Log in' do
      context "when successful" do
        it "When clicked, we are taken to the login page with a welcome message" do
          expect(page).to have_link("Sign in with Spotify")
          login_with_oauth
          expect(current_path).to eq(root_path)
          expect(page).to have_content("Welcome, Test User")
        end
      end 
      
      context "when NOT successful" do
        it 'when clicked, we are taken to the login page' do
          click_on('Sign in with Spotify')
          expect(current_path).to eq(root_path)
          expect(page).to have_content("Spotify Login Failed")
        end
      end 
    end

    describe "Link to logout" do
      it "when clicked, the user is logged out with a message notification" do
        login_with_oauth
        expect(page).to have_link("Logout")
        click_link "Logout"
        expect(page).to_not have_link("Logout")
        expect(page).to have_link("Sign in with Spotify")
        expect(current_path).to eq(root_path)
        expect(page).to have_content("You have been logged out")
      end
    end

    describe "Link to go home " do
      it "when clicked, the user is redirected to the home page" do
        expect(page).to have_link("Home")
        click_link("Home")
        expect(current_path).to eq(root_path)
      end
    end

    describe "Link to take a quiz" do
      it "when clicked, the user is redirected to the quiz show page" do
        expect(page).to have_link("what kind of lawyer are you?")
        click_link("what kind of lawyer are you?")
        expect(current_path).to eq(quiz_path(1))
      end
    end

    describe "quiz images" do
      it "when visiting the home page, there are images for each given quiz " do
        expect(page).to have_css("img.quiz-image")
      end
    end
  end
end