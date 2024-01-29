# Book Library API

## Ruby Version and Gems

- Ruby version: 3.3.0
- Gems:
  - pg (PostgreSQL): ~1.1
  - rails: 7.1.3
  - puma: 6.4.2
  - nokogiri: 1.16.0
  - actioncable: 7.1.3
  - actionmailbox: 7.1.3
  - actionmailer: 7.1.3
  - actiontext: 7.1.3
  - activestorage: 7.1.3
  - railties: 7.1.3
  - pg_search

## Database

- PostgreSQL version: 16.01

## Getting Started

The database already contains some books for testing purposes. To set up the database, simply run the following commands:

```shell
$ rails db:migrate
$ rails db:seed
```
## Searching for Books

You can search for books in the library using various parameters:

- **Search by book name:**
  - URL: `localhost:3000/books?books={book_name}`

- **Search by category:**
  - URL: `localhost:3000/books?categories={X,Y}`

- **Search by publisher:**
  - URL: `localhost:3000/books?publishers={X,Y}`

You can also search books from multiple publishers and categories within those publishers:
localhost:3000/books?categories={X,Y}&publishers={X,Y}