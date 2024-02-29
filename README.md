# Book Library API

## Ruby Version and Gems

- Ruby version: 3.3.0
- Gems:
  - actioncable, 7.1.3
  - actionmailbox, 7.1.3
  - actionmailer, 7.1.3
  - actiontext, 7.1.3
  - activestorage, 7.1.3
  - activesupport, ~> 7.1
  - bootsnap, require: false
  - capybara
  - database_cleaner-active_record (group: :test)
  - devise_token_auth, >= 1.0.0 (from https://github.com/lynndylanhurley/devise_token_auth)
  - factory_bot_rails (group: :development, :test)
  - faker (group: :development, :test)
  - letter_opener (group: :development)
  - mailcatcher
  - nokogiri, 1.16.0
  - pg, ~> 1.1
  - pg_search
  - psych, 3.3.0
  - puma, 6.4.2
  - rack-cors
  - rails, 7.1.3
  - railties, 7.1.3
  - rbs
  - rspec-rails (group: :development, :test)
  - solargraph (group: :development, :test)
  - tzinfo-data (platforms: :jruby)

## Database

- PostgreSQL version: 16.01

## Getting Started

The database already contains some books for testing purposes. To set up the database, simply run the following commands:

```shell
$ rails db:migrate
$ rails db:seed
```
## Books

You can search for books in the library using various parameters:

- **Search by book name:**
  - URL: `http://localhost:3000/books?books={book_name}`

- **Search by category:**
  - URL: `http://localhost:3000/books?categories={X,Y}`

- **Search by publisher:**
  - URL: `http://localhost:3000/books?publishers={X,Y}`

- **Show all books:**
  - URL: `http://localhost:3000/list_books`

You can also search books from multiple publishers and categories within those publishers:
`localhost:3000/books?categories={X,Y}&publishers={X,Y}`

## Users

Users register with unique email (it is used as uid), parameters are:
  - name;
  - email;
  - password;
  - password_confirmation;

None of those fields can be blank, and password and password_confirmation must match.

After registration, an email with a unique containing a random token is sent to the email, captured by MailCatcher.
Users must click the confirmation link sent in order for the account to be registered.
Registered users can:
  - CREATE: books, publishers, categories;
  - READ: books, publishers, categories;
  - UPDATE: books, publishers, categories;
  - DELETE: books, publishers, categories;

- **Register user:**
  - URL: `http://localhost:3000/auth
    
- **User login:**
  - URL `http://localhost:3000/auth/sign_in
  
- **List all users:**
  - URL: `http://localhost:3000/list_users
    
- **List current user session info:**
  - URL: `http://localhost:3000/users/info