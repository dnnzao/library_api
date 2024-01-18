# db/seeds.rb

# Categories
fantasy_category = Category.create(name: 'Fantasy')
sci_fi_category = Category.create(name: 'Sci-Fi')
mystery_category = Category.create(name: 'Mystery')
science_category = Category.create(name: 'Science')

# Publishers
publisher1 = Publisher.create(name: 'Penguin Random House')
publisher2 = Publisher.create(name: 'HarperCollins')
publisher3 = Publisher.create(name: 'Simon & Schuster')
publisher4 = Publisher.create(name: 'Macmillan Publishers')

# Books
Book.create(title: 'The Hobbit', author: 'J.R.R. Tolkien', published_date: Date.parse('1937-09-21'), category: fantasy_category, publisher: publisher1)
Book.create(title: 'Harry Potter and the Sorcerer\'s Stone', author: 'J.K. Rowling', published_date: Date.parse('1997-06-26'), category: fantasy_category, publisher: publisher2)
Book.create(title: 'Dune', author: 'Frank Herbert', published_date: Date.parse('1965-06-01'), category: sci_fi_category, publisher: publisher1)
Book.create(title: 'Neuromancer', author: 'William Gibson', published_date: Date.parse('1984-07-01'), category: sci_fi_category, publisher: publisher2)
Book.create(title: 'The Girl with the Dragon Tattoo', author: 'Stieg Larsson', published_date: Date.parse('2005-08-23'), category: mystery_category, publisher: publisher1)
Book.create(title: 'Sherlock Holmes: The Hound of the Baskervilles', author: 'Arthur Conan Doyle', published_date: Date.parse('1902-08-25'), category: mystery_category, publisher: publisher2)
Book.create(title: 'A Brief History of Time', author: 'Stephen Hawking', published_date: Date.parse('1988-04-01'), category: science_category, publisher: publisher1)
Book.create(title: 'Cosmos', author: 'Carl Sagan', published_date: Date.parse('1980-09-28'), category: science_category, publisher: publisher2)

# Additional Fantasy Books
Book.create(title: 'The Lord of the Rings', author: 'J.R.R. Tolkien', published_date: Date.parse('1954-07-29'), category: fantasy_category, publisher: publisher1)
Book.create(title: 'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe', author: 'C.S. Lewis', published_date: Date.parse('1950-10-16'), category: fantasy_category, publisher: publisher2)
Book.create(title: 'Game of Thrones', author: 'George R.R. Martin', published_date: Date.parse('1996-08-06'), category: fantasy_category, publisher: publisher1)

# Additional Sci-Fi Books
Book.create(title: 'Foundation', author: 'Isaac Asimov', published_date: Date.parse('1951-05-01'), category: sci_fi_category, publisher: publisher2)
Book.create(title: 'Ender\'s Game', author: 'Orson Scott Card', published_date: Date.parse('1985-01-15'), category: sci_fi_category, publisher: publisher1)
Book.create(title: 'The Hitchhiker\'s Guide to the Galaxy', author: 'Douglas Adams', published_date: Date.parse('1979-10-12'), category: sci_fi_category, publisher: publisher2)

# Additional Mystery Books
Book.create(title: 'Gone Girl', author: 'Gillian Flynn', published_date: Date.parse('2012-05-24'), category: mystery_category, publisher: publisher1)
Book.create(title: 'The Da Vinci Code', author: 'Dan Brown', published_date: Date.parse('2003-03-18'), category: mystery_category, publisher: publisher2)
Book.create(title: 'The Silence of the Lambs', author: 'Thomas Harris', published_date: Date.parse('1988-05-13'), category: mystery_category, publisher: publisher1)

# Additional Science Books
Book.create(title: 'Sapiens: A Brief History of Humankind', author: 'Yuval Noah Harari', published_date: Date.parse('2011-11-15'), category: science_category, publisher: publisher2)
Book.create(title: 'The Selfish Gene', author: 'Richard Dawkins', published_date: Date.parse('1976-05-01'), category: science_category, publisher: publisher1)
Book.create(title: 'The Innovators', author: 'Walter Isaacson', published_date: Date.parse('2014-10-07'), category: science_category, publisher: publisher2)

puts 'Seed data has been created.'
