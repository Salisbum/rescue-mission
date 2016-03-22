require 'rails_helper'

=begin
As a user
I want to post a question
So that I can receive help from others

Acceptance Criteria

- I must provide a title that is at least 40 characters long
- I must provide a description that is at least 150 characters long
- I must be presented with errors if I fill out the form incorrectly
=end

feature 'add a new question' do
  scenario 'user views add new question form' do
    Question.create(title: "How do I do the derp?", description: "I really want to know what 'derp' means and how one does it. It is just a simple error? Do I make an easy mistake? Why is it often 'Derp' and used as a name? I don't understand that meme at all, guys. HALP.")

    Question.create(title: "How do I do the HERP?", description: "Is HERP similar to DERP? what's the difference? AGAIN WITH THE MEME's guys. I see all these images online, including for people like Derpina and Herpina, and it's all so confusing. HOW Is IT RELATED TO DERP?")

     visit '/questions'

     expect(page).to have_content ("How do I do the derp?")
     expect(page).to have_content ("How do I do the HERP?")

     click_link "New Question"

     expect(page).to have_content ("Title")
     expect(page).to have_content ("Description")
  end

  scenario 'user adds new valid question' do
    visit '/questions'

    click_link "New Question"

    expect(page).to have_content ("Title")
    expect(page).to have_content ("Description")

    fill_in "Title", with: "What do I need to do to go to mars?"
    fill_in "Description", with: "In order to go to Mars, I know I need to do a few things. What are they? Food? Transport? How am I gonna live? What will I breathe? Are the views nice? What's it like on Mars? How can I know I'll live more than one day? Is it colder or warmer? Can I communicate with Earth?"
    click_button "Submit Question"
    expect(page).to have_content ("What do I need to do to go to mars?")
  end

  scenario 'user adds new invalid question' do
    visit '/questions'

    click_link "New Question"

    expect(page).to have_content ("Title")
    expect(page).to have_content ("Description")

    fill_in "Title", with: "I dun messed up"
    fill_in "Description", with: "Bad description"
    click_button "Submit Question"
    expect(page).to have_content ("Question not created!")
  end
end
