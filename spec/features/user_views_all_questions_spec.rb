require 'rails_helper'

# As a user
# I want to view recently posted questions
# So that I can help others

# Acceptance Criteria

# - I must see the title of each question
# - I must see questions listed in order, most recently posted first

feature 'all questions are listed on index page' do
  scenario 'user views index page of questions' do
    Question.create(title: 'How do I derp?', description: 'I really want to know how to derp. I really want to know how to derp.I really want to know how to derp.I really want to know how to derp.I really want to know how to derp.')

    Question.create(title: 'How do I HERP?', description: 'I really want to know how to herp. I really want to know how to herp.I really want to know how to herp.I really want to know how to herp.I really want to know how to herp.')

    visit '/questions'

    expect(page).to have_content ('How do I derp?')
    expect(page).to have_content ('How do I HERP?')
  end
end
