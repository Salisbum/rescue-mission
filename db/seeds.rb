# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

creator_1 = User.create(
  provider: "github",
  uid: "1",
  username: "herp",
  email: "herp@gmail.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
)

creator_2 = User.create(
  provider: "github",
  uid: "9",
  username: "derp",
  email: "derp@gmail.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
)

creator_3 = User.create(
  provider: "github",
  uid: "3",
  username: "derpimir",
  email: "derpimir@gmail.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
)

q_derp = Question.create(title: "How do I do the derp?", description: "I really want to know what 'derp' means and how one does it. It is just a simple error? Do I make an easy mistake? Why is it often 'Derp' and used as a name? I don't understand that meme at all, guys. HALP.", user: creator_1)

q_herp = Question.create(title: "How do I do the HERP?", description: "Is HERP similar to DERP? what's the difference? AGAIN WITH THE MEME's guys. I see all these images online, including for people like Derpina and Herpina, and it's all so confusing. HOW Is IT RELATED TO DERP?", user: creator_2)

q_pb = Question.create(title: "What is the recipe for a peanut butter jelly sandwich?", description: "I really want to know how to make a sandwich, guys. I've been told that a peanut butter and jelly, or what you might call a 'pb&j', is the easiest way to go when you just start.", user: creator_3)

q_beer = Question.create(title: "How do I choose a tasty beer?", description: "Do I choose the beer based on hops? based on malt? what are these words, even? All I've ever had to drink is budweiser but my friends tell me that that's really bad.", user: creator_1)

q_egg = Question.create(title: "What's the best way to eat a mini-egg?", description: "I've been told that there are certain ways one should enjoy the once-a-year seasonal treat that is cadbury mini-eggs? Do you people freeze them? Melt them?", user: creator_2)

Answer.create(description: "You should freeze them. Because freezing candy makes everything better. Honestly. Do it next halloween. You'll thank me.", user: creator_3, question: q_egg)

Answer.create(description: "ALL THE IPA's. Because IPA's are the shit. Everyone should love them. Seriously. What's wrong with you if you don't like IPAs.", user: creator_2, question: q_beer)

Answer.create(description: "Buy pb. Buy jelly. Slather on bread. Smoosh. That's a loooove sandwich, pb&j. Strawberry is the classic jelly of choice, here.", user: creator_1, question: q_pb)

Answer.create(description: "Herp is a subgenre of derp. Functionally the same, mostly. I mean, there are specific use cases that you should know about, but you'll run into them. Google it!", user: creator_3, question: q_herp)

Answer.create(description: "To Derp is to make a silly mistake. A Derp is a person who consistently derps. Derp is a meme representative of these situations.", user: creator_2, question: q_derp)

Answer.create(description: "MELT THEEEMMM. Actually no, wait, don't, that's gross. Melted chocolate is horrible. Also, I'm not sure that you even can given the hard candy shell.", user: creator_1, question: q_egg)

Answer.create(description: "Drink whatever you like, man. don't let nobody tell you what to do. if you want to drink bud, then drink bud. though it doesn't hurt to see what else you like.", user: creator_3, question: q_beer)

Answer.create(description: "Make sure the pb and jelly is organic, or else you'll die. lol jk.", user: creator_2, question: q_pb)
