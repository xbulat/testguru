# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users
users = User.create!([{ first_name: 'John', last_name: 'Doe', login: 'john', email: 'john@example.com' },
              { first_name: 'Jane', last_name: 'Doe', login: 'jane', email: 'jane@example.com' }])

# categories
categories = %w[Language Sience Art Religion].map { |c| Category.create!(title: c) }

# tests
tests = categories.map do |c|
  %w[Basics History].map do |t|
    Test.create!(title: "#{t} of #{c.title}",
                 level: rand(6),
                 category_id: c.id,
                 user_id: users.sample)
  end
end.flatten

# questions
questions = tests.flat_map do |test|
  Array.new(10) do |i|
    Question.create!(test_id: test.id, body: "#{i}. Question")
  end
end

# answers
questions.map(&:id).each do |q|
  Answer.create!(body: 'Example body', correct: [true, false].sample, question_id: q)
end

# passed tests
tests.map(&:id).each do |t|
  users.map(&:id).each { |u| UserPassedTest.create!(user_id: u, test_id: t) }
end
