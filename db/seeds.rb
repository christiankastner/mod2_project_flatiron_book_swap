# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# This seeds the database with books for testing
def seed_books
    Book.destroy_all

    Book.create_from_googlebooks("Unbearable Lightness of Being")
    Book.create_from_googlebooks("Of Human Bondage")
    Book.create_from_googlebooks("The Terror")

    Book.create_from_txt("./db/titles.txt")
end

# This seeds the database with users for testing. Expected to be run after seeding books so that user shelves can be
# populated
def seed_users
    User.destroy_all
    Shelf.destroy_all

    (0..10).each do 
        @user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password, username: Faker::Internet.user_name)
        @shelf = Shelf.create(user_id: @user.id)
        (1..rand(30)).each do
            ShelfBook.create(shelf_id: @shelf.id, book_id: Book.all.sample.id, shelf_type: rand(3))
        end
    end
end




