FactoryGirl.define do

  factory :card do
    original_text   "fox"
    translated_text "lisa"
    review_date Date.today + 3.days
  end
end
