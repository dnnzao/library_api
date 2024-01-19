# db/seeds.rb

# Categories
fantasy_category = Category.find_or_create_by(category: 'Fantasy')
sci_fi_category = Category.find_or_create_by(category: 'Sci-Fi')
mystery_category = Category.find_or_create_by(category: 'Mystery')
science_category = Category.find_or_create_by(category: 'Science')

# Publishers
publisher1 = Publisher.find_or_create_by(publisher_name: 'Penguin Random House')
publisher2 = Publisher.find_or_create_by(publisher_name: 'HarperCollins')
publisher3 = Publisher.find_or_create_by(publisher_name: 'Simon & Schuster')
publisher4 = Publisher.find_or_create_by(publisher_name: 'Macmillan Publishers')

# Books
Book.create(book_name: 'The Hobbit', author: 'J.R.R. Tolkien', published_date: Date.parse('1937-09-21'), categories_id: fantasy_category.id, publishers_id: publisher1.id)
Book.create(book_name: 'Harry Potter and the Sorcerer\'s Stone', author: 'J.K. Rowling', published_date: Date.parse('1997-06-26'), categories_id: fantasy_category.id, publishers_id: publisher2.id)
Book.create(book_name: 'Dune', author: 'Frank Herbert', published_date: Date.parse('1965-06-01'), categories_id: sci_fi_category.id, publishers_id: publisher1.id)
Book.create(book_name: 'Neuromancer', author: 'William Gibson', published_date: Date.parse('1984-07-01'), categories_id: sci_fi_category.id, publishers_id: publisher2.id)
Book.create(book_name: 'The Girl with the Dragon Tattoo', author: 'Stieg Larsson', published_date: Date.parse('2005-08-23'), categories_id: mystery_category.id, publishers_id: publisher1.id)
Book.create(book_name: 'Sherlock Holmes: The Hound of the Baskervilles', author: 'Arthur Conan Doyle', published_date: Date.parse('1902-08-25'), categories_id: mystery_category.id, publishers_id: publisher2.id)
Book.create(book_name: 'A Brief History of Time', author: 'Stephen Hawking', published_date: Date.parse('1988-04-01'), categories_id: science_category.id, publishers_id: publisher1.id)
Book.create(book_name: 'Cosmos', author: 'Carl Sagan', published_date: Date.parse('1980-09-28'), categories_id: science_category.id, publishers_id: publisher2.id)

# Additional Fantasy Books
Book.create(book_name: 'The Lord of the Rings', author: 'J.R.R. Tolkien', published_date: Date.parse('1954-07-29'), categories_id: fantasy_category.id, publishers_id: publisher1.id)
Book.create(book_name: 'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe', author: 'C.S. Lewis', published_date: Date.parse('1950-10-16'), categories_id: fantasy_category.id, publishers_id: publisher2.id)
Book.create(book_name: 'Game of Thrones', author: 'George R.R. Martin', published_date: Date.parse('1996-08-06'), categories_id: fantasy_category.id, publishers_id: publisher1.id)

# Additional Sci-Fi Books
Book.create(book_name: 'Foundation', author: 'Isaac Asimov', published_date: Date.parse('1951-05-01'), categories_id: sci_fi_category.id, publishers_id: publisher2.id)
Book.create(book_name: 'Ender\'s Game', author: 'Orson Scott Card', published_date: Date.parse('1985-01-15'), categories_id: sci_fi_category.id, publishers_id: publisher1.id)
Book.create(book_name: 'The Hitchhiker\'s Guide to the Galaxy', author: 'Douglas Adams', published_date: Date.parse('1979-10-12'), categories_id: sci_fi_category.id, publishers_id: publisher2.id)

# Additional Mystery Books
Book.create(book_name: 'Gone Girl', author: 'Gillian Flynn', published_date: Date.parse('2012-05-24'), categories_id: mystery_category.id, publishers_id: publisher1.id)
Book.create(book_name: 'The Da Vinci Code', author: 'Dan Brown', published_date: Date.parse('2003-03-18'), categories_id: mystery_category.id, publishers_id: publisher2.id)
Book.create(book_name: 'The Silence of the Lambs', author: 'Thomas Harris', published_date: Date.parse('1988-05-13'), categories_id: mystery_category.id, publishers_id: publisher1.id)

# Additional Science Books
Book.create(book_name: 'Sapiens: A Brief History of Humankind', author: 'Yuval Noah Harari', published_date: Date.parse('2011-11-15'), categories_id: science_category.id, publishers_id: publisher2.id)
Book.create(book_name: 'The Selfish Gene', author: 'Richard Dawkins', published_date: Date.parse('1976-05-01'), categories_id: science_category.id, publishers_id: publisher1.id)
Book.create(book_name: 'The Innovators', author: 'Walter Isaacson', published_date: Date.parse('2014-10-07'), categories_id: science_category.id, publishers_id: publisher2.id)

puts 'Seed data has been created.'
