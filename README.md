# mod3_project_flatiron_book_swap
Flatiron Book Swap is a "Paperback Swap" clone that uses the google books api to search for swappable books for users. Users can create/login to their profile where they can add books into a desired, private, and openly swappable shelf. Users can then find other users offering books to swap, to which they (current user) can choose a book in their public shelf to swap with another user. Users can also move books from their private shelf into their public shelf for swapping, and delete any book in their shelf. They can also edit their own user information and delete their profile.

As of now, their is no functionality to send requests to other users for swapping. This was a result of a small project timeframe and is something I definitely would like to implement.

## Installation
Run 'bundle install' to install required gems. The additional gems 'googlebooks' and 'faker' were used as well as uncommenting BCrypt from the given gem suite in Rails.
bash
bundle install
Run 'rails db:migrate' in the root directory to create the database locally. The database is already seeded and pupulated with fake user data as proof of concept.
bash
rake db:migrate
ruby bin/run.rb
Have fun swapping!
## Contributing
Contributions are welcome. Feel free to open a pull request or branch from this project. Make it your own!
## License
[MIT](https://choosealicense.com/licenses/mit/)
