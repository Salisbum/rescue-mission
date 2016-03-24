require 'rails_helper'

=begin
As a user
I want to answer another user's question
So that I can help them solve their problem

Acceptance Criteria

- I must be on the question detail page
- I must provide a description that is at least 50 characters long
- I must be presented with errors if I fill out the form incorrectly
=end

feature 'answer a question' do
  scenario 'user answers a question' do
    Question.create(title: "How do I do the derp?", description: "I really want to know what 'derp' means and how one does it. It is just a simple error? Do I make an easy mistake? Why is it often 'Derp' and used as a name? I don't understand that meme at all, guys. HALP.")

    Question.create(title: "How do I do the HERP?", description: "Is HERP similar to DERP? what's the difference? AGAIN WITH THE MEME's guys. I see all these images online, including for people like Derpina and Herpina, and it's all so confusing. HOW Is IT RELATED TO DERP?")

    visit '/questions'

    expect(page).to have_content ("How do I do the derp?")
    expect(page).to have_content ("How do I do the HERP?")

    click_link "How do I do the HERP?"

    expect(page).to have_content("How do I do the HERP?")
    expect(page).to have_content("Is HERP similar to DERP?")

    fill_in "Answer", with: "Herp is a sister-meme to Derp, in that you can herp and derp, and a herp could be a derp, but it is not a verb in the same way that derp is. One cannot simply 'herp.' You might vocalize HERPDERP though."

    click_button "Submit Answer"
    expect(page).to have_content ('Answer successfully submitted!')
  end

  scenario 'user submits invalid answer' do
    Question.create(title: "How do I do the derp?", description: "I really want to know what 'derp' means and how one does it. It is just a simple error? Do I make an easy mistake? Why is it often 'Derp' and used as a name? I don't understand that meme at all, guys. HALP.")

    Question.create(title: "How do I do the HERP?", description: "Is HERP similar to DERP? what's the difference? AGAIN WITH THE MEME's guys. I see all these images online, including for people like Derpina and Herpina, and it's all so confusing. HOW Is IT RELATED TO DERP?")

    visit '/questions'

    expect(page).to have_content ("How do I do the derp?")
    expect(page).to have_content ("How do I do the HERP?")

    click_link "How do I do the HERP?"

    expect(page).to have_content("How do I do the HERP?")
    expect(page).to have_content("Is HERP similar to DERP?")

    fill_in "Answer", with: "Herp is a sister-meme to Derp."

    click_button "Submit Answer"
    expect(page).to have_content ('Answer was not saved!')
  end
end
