# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "admin@alphablog.com", username: "admin", password: "admin123", admin: true)

for i in 1..3 do
  User.create(email: "user#{i}@alphablog.com", username: "user#{i}", password: "password!#{i}")
end

%w(News Technology Sports Medicine).each do |name|
  Category.create(name: name)
end

User.all.each do |user| 
  random_end = 1 + rand(4)
  for i in 1..random_end
    article = user.articles.build(title: "Article #{i}", description: "This is a great article. Article #{i} will have you greatly intrigued.")
    random_categories = Category.all.sample(2)
    random_categories.each do |category|
      article.article_categories.build(category_id: category.id)
    end
    article.save
  end
end
