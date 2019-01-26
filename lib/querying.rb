def select_books_titles_and_years_in_first_series_order_by_year
  "
  SELECT
    b.title,
    b.year
  FROM
    books b
    JOIN series s on b.series_id = s.id
  WHERE
    s.id = (SELECT MIN(id) FROM series)
  ORDER BY
    b.year ASC;
  "
end

def select_name_and_motto_of_char_with_longest_motto
  "
  SELECT
    name,
    motto
  FROM
    characters
  WHERE
    LENGTH(motto) = (SELECT MAX(LENGTH(motto)) FROM characters);
  "
end


def select_value_and_count_of_most_prolific_species
  "
  SELECT
    species,
    count(*) as count
  FROM
    characters
  GROUP BY
    species
  ORDER BY 
    count DESC
  LIMIT 1;
  "
end

def select_name_and_series_subgenres_of_authors
  "
  SELECT DISTINCT
    a.name as author,
    s.name as subgenre
  FROM
    authors a
    JOIN series se on a.id = se.author_id
    JOIN subgenres s on se.subgenre_id = s.id
  "
end

def select_series_title_with_most_human_characters
  "
  SELECT title FROM (
    SELECT
      s.title,
      count(*) as count
    FROM
      series s
      JOIN characters c on s.id = c.series_id
    WHERE
      c.species = 'human'
    GROUP BY
      s.title
    ORDER BY
      count DESC
    LIMIT 1);
  "
end

def select_character_names_and_number_of_books_they_are_in
  "
  SELECT
    c.name as character,
    count(*) as count
  FROM
    characters c
    JOIN character_books cb on c.id = cb.character_id
  GROUP BY
    character
  ORDER BY
    count DESC;
  "
end
