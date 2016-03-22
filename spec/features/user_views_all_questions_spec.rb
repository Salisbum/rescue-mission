require 'rails_helper'

# As a user
# I want to view recently posted questions
# So that I can help others

# Acceptance Criteria

# - I must see the title of each question
# - I must see questions listed in order, most recently posted first

feature 'all questions are listed on index page' do
  scenario 'user views index page of questions' do
    Question.create(title: "How do I do the derp?", description: "I really want to know what 'derp' means and how one does it. It is just a simple error? Do I make an easy mistake? Why is it often 'Derp' and used as a name? I don't understand that meme at all, guys. HALP.")

    Question.create(title: "How do I do the HERP?", description: "Is HERP similar to DERP? what's the difference? AGAIN WITH THE MEME's guys. I see all these images online, including for people like Derpina and Herpina, and it's all so confusing. HOW Is IT RELATED TO DERP?")

    Question.create(title: "What is the recipe for a peanut butter jelly sandwich?", description: "I really want to know how to make a sandwich, guys. I've been told that a peanut butter and jelly, or what you might call a 'pb&j', is the easiest way to go when you just start.")

    Question.create(title: "How do I choose a tasty beer?", description: "Do I choose the beer based on hops? based on malt? what are these words, even? All I've ever had to drink is budweiser but my friends tell me that that's really bad.")

    Question.create(title: "What's the best way to eat a mini-egg?", description: "I've been told that there are certain ways one should enjoy the once-a-year seasonal treat that is cadbury mini-eggs? Do you people freeze them? Melt them?")

    visit '/questions'

    expect(page).to have_content ("How do I do the derp?")
    expect(page).to have_content ("How do I do the HERP?")
    expect(page).to_not have_content ("What's the best way to eat a mini-egg?")
  end
end
