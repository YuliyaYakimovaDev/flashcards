require 'rails_helper'

describe Card do
  before(:each) do
    @card = Card.create(original_text: "dog", translated_text: "sobaka", review_date: Date.today + 3.days)
  end
end
