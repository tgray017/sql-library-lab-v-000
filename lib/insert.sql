INSERT INTO series (title, author_id, subgenre_id) VALUES 
  ("A Song of Ice and Fire", 1, 1),
  ("Harry Potter", 2, 1)
;

INSERT INTO books (title, year, series_id) VALUES 
  ("A Game of Thrones", 1990, 1),
  ("A Feast for Crows", 1992, 1),
  ("A Dance of Dragons", 1994, 1),
  ("Harry Potter and the Sorcerer's Stone", 1999, 2),
  ("Harry Potter and the Chamber of Secrets", 2001, 2),
  ("Harry Potter and the Prisoner of Azkaban", 2003, 2)
;

INSERT INTO characters (name, motto, species, author_id, series_id) VALUES 
  ("Tyrion Lannister", "A Lannister always pays his debts", "human", 1, 1),
  ("Tywin Lannister", "A Lannister always pays his debts", "human", 1, 1),
  ("Cersei Lannister", "A Lannister always pays his debts", "human", 1, NULL),
  ("Jaime Lannister", "A Lannister always pays his debts", "human", 1, NULL),
  ("Harry Potter", "I love magic", "human", 2, 2),
  ("Hermione Granger", "I love magic", "human", 2, 2),
  ("Ron Weasley", "I love magic", "human", 2, NULL),
  ("Draco Malfoy", "I love magic", "human", 2, NULL)
;

INSERT INTO subgenres (name) VALUES 
  ("Fantasy"),
  ("Fiction")
;

INSERT INTO authors (name) VALUES 
  ("George R.R. Martin"),
  ("J.K. Rowling")
;

INSERT INTO character_books (book_id, character_id)
  SELECT DISTINCT
    b.id,
    c.id
  FROM
    characters c
    LEFT JOIN series s on c.series_id = s.id
    LEFT JOIN books b on s.id = b.series_id
;