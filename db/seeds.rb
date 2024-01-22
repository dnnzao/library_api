# db/seeds.rb

# Categories
fantasy_category = Category.find_or_create_by(name: 'Fantasy')
sci_fi_category = Category.find_or_create_by(name: 'Sci-Fi')
mystery_category = Category.find_or_create_by(name: 'Mystery')
science_category = Category.find_or_create_by(name: 'Science')

# Publishers
publisher1 = Publisher.find_or_create_by(name: 'Penguin Random House')
publisher2 = Publisher.find_or_create_by(name: 'HarperCollins')
publisher3 = Publisher.find_or_create_by(name: 'Simon & Schuster')
publisher4 = Publisher.find_or_create_by(name: 'Macmillan Publishers')

# Books
Book.create(book_name: 'The Hobbit', author: 'J.R.R. Tolkien', published_date: Date.parse('1937-09-21'), category: fantasy_category, publisher: publisher1)
Book.create(book_name: 'Harry Potter and the Sorcerer\'s Stone', author: 'J.K. Rowling', published_date: Date.parse('1997-06-26'), category: fantasy_category, publisher: publisher2)
Book.create(book_name: 'Dune', author: 'Frank Herbert', published_date: Date.parse('1965-06-01'), category: sci_fi_category, publisher: publisher1)
Book.create(book_name: 'Neuromancer', author: 'William Gibson', published_date: Date.parse('1984-07-01'), category: sci_fi_category, publisher: publisher2)
Book.create(book_name: 'The Girl with the Dragon Tattoo', author: 'Stieg Larsson', published_date: Date.parse('2005-08-23'), category: mystery_category, publisher: publisher1)
Book.create(book_name: 'Sherlock Holmes: The Hound of the Baskervilles', author: 'Arthur Conan Doyle', published_date: Date.parse('1902-08-25'), category: mystery_category, publisher: publisher2)
Book.create(book_name: 'A Brief History of Time', author: 'Stephen Hawking', published_date: Date.parse('1988-04-01'), category: science_category, publisher: publisher1)
Book.create(book_name: 'Cosmos', author: 'Carl Sagan', published_date: Date.parse('1980-09-28'), category: science_category, publisher: publisher2)
Book.create(book_name: 'The Lord of the Rings', author: 'J.R.R. Tolkien', published_date: Date.parse('1954-07-29'), category: fantasy_category, publisher: publisher1)
Book.create(book_name: 'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe', author: 'C.S. Lewis', published_date: Date.parse('1950-10-16'), category: fantasy_category, publisher: publisher2)
Book.create(book_name: 'Game of Thrones', author: 'George R.R. Martin', published_date: Date.parse('1996-08-06'), category: fantasy_category, publisher: publisher1)
Book.create(book_name: 'Foundation', author: 'Isaac Asimov', published_date: Date.parse('1951-05-01'), category: sci_fi_category, publisher: publisher2)
Book.create(book_name: 'Ender\'s Game', author: 'Orson Scott Card', published_date: Date.parse('1985-01-15'), category: sci_fi_category, publisher: publisher1)
Book.create(book_name: 'The Hitchhiker\'s Guide to the Galaxy', author: 'Douglas Adams', published_date: Date.parse('1979-10-12'), category: sci_fi_category, publisher: publisher2)
Book.create(book_name: 'Gone Girl', author: 'Gillian Flynn', published_date: Date.parse('2012-05-24'), category: mystery_category, publisher: publisher1)
Book.create(book_name: 'The Da Vinci Code', author: 'Dan Brown', published_date: Date.parse('2003-03-18'), category: mystery_category, publisher: publisher2)
Book.create(book_name: 'The Silence of the Lambs', author: 'Thomas Harris', published_date: Date.parse('1988-05-13'), category: mystery_category, publisher: publisher1)
Book.create(book_name: 'Sapiens: A Brief History of Humankind', author: 'Yuval Noah Harari', published_date: Date.parse('2011-11-15'), category: science_category, publisher: publisher2)
Book.create(book_name: 'The Selfish Gene', author: 'Richard Dawkins', published_date: Date.parse('1976-05-01'), category: science_category, publisher: publisher1)
Book.create(book_name: 'The Innovators', author: 'Walter Isaacson', published_date: Date.parse('2014-10-07'), category: science_category, publisher: publisher2)
Book.create(book_name: 'Fantasy Book from Simon & Schuster', author: 'Author 1', published_date: Date.parse('2023-01-01'), category: fantasy_category, publisher: publisher3)
Book.create(book_name: 'Mystery Book from Simon & Schuster', author: 'Author 2', published_date: Date.parse('2023-02-01'), category: mystery_category, publisher: publisher3)
Book.create(book_name: 'Sci-fi Book from Simon & Schuster', author: 'Author 3', published_date: Date.parse('2023-03-01'), category: sci_fi_category, publisher: publisher3)
Book.create(book_name: 'Science Book from Simon & Schuster', author: 'Author 4', published_date: Date.parse('2023-04-01'), category: science_category, publisher: publisher3)
Book.create(book_name: 'Fantasy Book from Macmillan Publishers', author: 'Author 5', published_date: Date.parse('2023-05-01'), category: fantasy_category, publisher: publisher4)
Book.create(book_name: 'Mystery Book from Macmillan Publishers', author: 'Author 6', published_date: Date.parse('2023-06-01'), category: mystery_category, publisher: publisher4)
Book.create(book_name: 'Sci-fi Book from Macmillan Publishers', author: 'Author 7', published_date: Date.parse('2023-07-01'), category: sci_fi_category, publisher: publisher4)
Book.create(book_name: 'Science Book from Macmillan Publishers', author: 'Author 8', published_date: Date.parse('2023-08-01'), category: science_category, publisher: publisher4)

puts 'Seed data has been created.'
