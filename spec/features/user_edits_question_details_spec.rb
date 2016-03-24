require 'rails_helper'

=begin
As a user
I want to edit a question
So that I can correct any mistakes or add updates

Acceptance Criteria

- I must provide valid information
- I must be presented with errors if I fill out the form incorrectly
- I must be able to get to the edit page from the question details page
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

    click_link "Edit Question"

    fill_in "Title", with: "How do I do the Herp?"
    click_button "Update"

    expect(page).to have_content("How do I do the Herp?")
  end
end
