require 'rails_helper'

describe Card do

  let(:card) { create(:card, original_text: "fox", translated_text: "lisa")}

  it "opiginal and tranlation are equal" do
    card = Card.new(original_text: "fox", translated_text: "fox")
    expect(card.check_original_and_translated_text).to include("can't be similar as translated text")
  end

  it "review date is set for today plus 3 days" do
    expect(card.set_time_to_now).to eq(Date.today + 3.days)
  end

  it "answer is correct" do
    expect(card.check_answer("fox")).to be true
  end

  it "random card is shown on the home page" do
    card.update_attributes(review_date: Date.today)
    expect(Card.random_card.nil?).to be false
  end
end
