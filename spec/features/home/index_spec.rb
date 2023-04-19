# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Home Page', type: :feature do
  before do
    visit root_path
  end

  context 'visiting the home page', :vcr do
    describe 'Link to Log in' do
      context 'when successful' do
        it 'When clicked, we are taken to the login page with a welcome message' do
          expect(page).to have_link('Sign in with Spotify')
          login_with_oauth
          expect(current_path).to eq(root_path)
          expect(page).to have_content('Welcome, Pinocchio')
        end
      end

      context 'when NOT successful' do
        it 'when clicked, we are taken to the login page' do
          click_on('Sign in with Spotify')
          expect(current_path).to eq(root_path)
          expect(page).to have_content('Spotify Login Failed')
        end
      end
    end

    describe 'Link to logout' do
      it 'when clicked, the user is logged out with a message notification' do
        login_with_oauth
        expect(page).to have_link('Logout')
        click_link 'Logout'
        expect(page).to_not have_link('Logout')
        expect(page).to have_link('Sign in with Spotify')
        expect(current_path).to eq(root_path)
        expect(page).to have_content('You have been logged out')
      end
    end

    describe 'Link to go home ' do
      it 'when clicked, the user is redirected to the home page' do
        expect(page).to have_link('Home')
        click_link('Home')
        expect(current_path).to eq(root_path)
      end
    end

    describe 'Link to take a quiz' do
      it 'when clicked, the user is redirected to the quiz show page' do
        title = "Want To Know Which Famous Lawyer You're Most Like? Take This Quiz And Achieve Ultimate Enlightenment!"
        expect(page).to have_link(title)
        click_link(title)
        expect(current_path).to eq(quiz_path(2))
      end
    end

    describe 'quiz images' do
      it 'when visiting the home page, there are images for each given quiz ' do
        save_and_open_page
        expect(page).to have_css("img[src^='https']")
      end
    end
  end
end
