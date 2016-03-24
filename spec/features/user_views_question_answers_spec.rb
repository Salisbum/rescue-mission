require 'rails_helper'

=begin
As a user
I want to view the answers for a question
So that I can learn from the answer

Acceptance Criteria

- I must be on the question detail page
- I must only see answers to the question I'm viewing
- I must see all answers listed in order, most recent last
=end

feature 'view answers for a question' do
  scenario 'user views all answers for a question' do

    q_herp = Question.create(title: "How do I do the HERP?", description: "Is HERP similar to DERP? what's the difference? AGAIN WITH THE MEME's guys. I see all these images online, including for people like Derpina and Herpina, and it's all so confusing. HOW Is IT RELATED TO DERP?")

    q_pb = Question.create(title: "What is the recipe for a peanut butter jelly sandwich?", description: "I really want to know how to make a sandwich, guys. I've been told that a peanut butter and jelly, or what you might call a 'pb&j', is the easiest way to go when you just start.")

    Answer.create(description: "Make sure the pb and jelly is organic, or else you'll die.", question: q_pb)

    Answer.create(description: "Buy pb. Buy jelly. Slather on bread. Smoosh. Eat. Omnomnomnomnomnom.", question: q_pb)

    visit '/questions'

    expect(page).to have_content ("What is the recipe for a peanut butter jelly sandwich?")

    expect(page).to have_content ("How do I do the HERP?")

    click_link "What is the recipe for a peanut butter jelly sandwich?"

    expect(page).to have_content ("Buy pb. Buy jelly. Slather on bread. Smoosh. Eat. Omnomnomnomnomnom.")
    expect(page).to have_content ("Make sure the pb and jelly is organic, or else you'll die.")
  end
end
