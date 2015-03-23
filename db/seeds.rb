require 'faker'

j = User.create!(username: "Jonathan", password: "jroger")
a = User.create!(username: "Alyssa", password: "Alycit")


q1 = Question.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: j)
q2 = Question.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user_id: 2)


a1 = Answer.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, question_id: 2, user_id: 1)
a2 = Answer.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, question_id: 1, user_id: 2)

Vote.create!(point: 5, parent: q1, user: j)
Vote.create!(point: 7, parent: a2, user: a)