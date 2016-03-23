require 'rails_helper'

=begin
As a user
I want to delete a question
So that I can delete duplicate questions

Acceptance Criteria

- I must be able delete a question from the question edit page
- I must be able delete a question from the question details page
- All answers associated with the question must also be deleted
=end

feature 'edit question details' do
  scenario 'user edits question details' do
    Question.create(title: "How do I do the derp?", description: "I really want to know what 'derp' means and how one does it. It is just a simple error? Do I make an easy mistake? Why is it often 'Derp' and used as a name? I don't understand that meme at all, guys. HALP.")

    Question.create(title: "How do I do the HERP?", description: "Is HERP similar to DERP? what's the difference? AGAIN WITH THE MEME's guys. I see all these images online, including for people like Derpina and Herpina, and it's all so confusing. HOW Is IT RELATED TO DERP?")

    visit '/questions'

    expect(page).to have_content ("How do I do the derp?")
    expect(page).to have_content ("How do I do the HERP?")

    click_link "How do I do the HERP?"

    expect(page).to have_content("How do I do the HERP?")

    click_button "Delete"

    expect(page).to_not have_content("How do I do the HERP?")
  end
end
