require 'rails_helper'

=begin
As a user
I want to view a question's details
So that I can effectively understand the question

Acceptance Criteria

- I must be able to get to this page from the questions index
- I must see the question's title
- I must see the question's description
=end

feature 'view question details' do
  scenario 'user views question details' do
    Question.create(title: "How do I do the derp?", description: "I really want to know what 'derp' means and how one does it. It is just a simple error? Do I make an easy mistake? Why is it often 'Derp' and used as a name? I don't understand that meme at all, guys. HALP.")

    Question.create(title: "How do I do the HERP?", description: "Is HERP similar to DERP? what's the difference? AGAIN WITH THE MEME's guys. I see all these images online, including for people like Derpina and Herpina, and it's all so confusing. HOW Is IT RELATED TO DERP?")

    visit '/questions'

    expect(page).to have_content ("How do I do the derp?")
    expect(page).to have_content ("How do I do the HERP?")

    click_link "How do I do the HERP?"

    expect(page).to have_content("How do I do the HERP?")
    expect(page).to have_content("Is HERP similar to DERP?")
  end
end
