# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users
users = User.create!([{ first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password', type: "Admin", confirmed_at: Time.now  },
              { first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password: 'password', confirmed_at: Time.now  }])

# categories
categories = %w[Language Sience Art Religion].map { |c| Category.create!(title: c) }

# tests
tests = categories.map do |c|
  %w[Basics History].map do |t|
    Test.create!(title: "#{t} of #{c.title}",
                 level: rand(1),
                 category_id: c.id,
                 user_id: users.sample.id)
  end
end.flatten

# questions
questions = tests.flat_map do |test|
  Array.new(4) do |i|
    Question.create!(test_id: test.id, body: "Question ##{i}")
  end
end

# answers
questions.map(&:id).each do |q|
  Answer.create!(body: 'simple answer', correct: [true, false].sample, question_id: q)
end

# passed tests
tests.map(&:id).each do |t|
  users.map(&:id).each { |u| UserPassedTest.create!(user_id: u, test_id: t) }
end

# gists
questions.slice(0..10).each do |q|
  Gist.create!(user: users.sample, url: "https://gist.example.com/#{SecureRandom.hex}", question: q)
end

# badge_rules
rule1 = BadgeRule.create!(rule: 'manual', argument: nil , description: "Manual")
rule2 = BadgeRule.create!(rule: 'first_try_success', argument: nil , description: "First time success")
rule3 = BadgeRule.create!(rule: 'all_in_category', argument: categories.first.id , description: "All tests in category #{categories.first.title}")
rule4 = BadgeRule.create!(rule: 'all_in_level', argument: tests.first.level , description: "All tests with level #{tests.first.level}")

# badges
Badge.create!(title: "Leader", image: 'leader.png', description: 'Manual', badge_rule: rule1)
Badge.create!(title: "First time success!", image: '1st_success.png', description: 'Success after 1st try', badge_rule: rule2)
Badge.create!(title: "Category is completed", image: 'winner_category.png', description: 'All tests in category were completed', badge_rule: rule3)
Badge.create!(title: "Level is completed", image: 'winner_level.png', description: 'All tests by level were completed', badge_rule: rule4)
