# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users
User.create([{first_name: 'John', last_name: 'Doe', login: 'john', email: 'john@example.com'},
            {first_name: 'Jane', last_name: 'Doe', login: 'jane', email: 'jane@example.com'}])

# categories
%w[Language Sience Art Religion].each { |c| Category.create(title: c) }

# tests
Category.pluck(:title, :id).each do |c|
  %w[Basics History].each do |t|
    Test.create(title: "#{t} of #{c[0]}",
                level: rand(4),
                category_id: c[1])
  end
end
# questions
Test.pluck(:id).each do |t|
  1.upto(10) { |q| Question.create(test_id: t, body: "#{q}. Question") }
end

# answers
Question.pluck(:id).each do |q|
  Answer.create(body: 'Example body', correct: rand(17).modulo(2), question_id: q)
end
