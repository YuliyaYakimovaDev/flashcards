require 'rails_helper'

describe "Check card" do

  before(:each) do
    @card = create(:card, original_text: "fox", translated_text: "lisa", review_date: Date.today)
    visit root_path
  end

  it "user is redirected to the all cards listing" do
    click_link 'All cards'
    expect(page).to have_content "Listing Cards"
  end

  it "correct answer" do
    fill_in :answer, with: @card.translated_text
    click_button 'Check your answer'
    expect(page).to have_content('Correct!')
  end

  it "incorrect answer" do
    fill_in :answer, with: "something"
    click_button 'Check your answer'
    expect(page).to have_content('Incorrect!')
  end
end
