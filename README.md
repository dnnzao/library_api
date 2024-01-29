# API for a book library.

### Ruby version and gems:

ruby '3.3.0'
gem 'pg', "~> 1.1"
gem 'rails', '7.1.3'
gem 'puma', '6.4.2'
gem 'nokogiri', '1.16.0'
gem 'actioncable', '7.1.3'
gem 'actionmailbox', '7.1.3'
gem 'actionmailer', '7.1.3'
gem 'actiontext', '7.1.3'
gem 'activestorage', '7.1.3'
gem 'railties', '7.1.3'
gem 'pg_search'

Database is in PostgreSQL v16.01

Database already has some books for testcase. simply run:
$ rails db:migrate
$ rails db:seed

You can search by book name (string), category id (integer), and publisher id (integer).

global url: localhost:3000/books
url for search books by name: localhost:3000/books?books={book_name}
url for search books by category: localhost:3000/books?categories={X,Y}
url for search books by publisher: localhost:3000/books?publishers={X,Y}

You can also search books from multiple publishers and categories within those publishers:
localhost:3000/books?categories={X,Y}&publishers={X,Y}