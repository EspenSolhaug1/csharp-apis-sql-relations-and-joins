CREATE TABLE directors (
    id serial PRIMARY KEY, 
    name varchar,
    country varchar
    );
CREATE TABLE actors (
    id serial PRIMARY KEY, 
    name varchar,
    dob Date
    );
CREATE TABLE writer (
    id serial PRIMARY KEY, 
    name varchar,
    email varchar
    );

CREATE TABLE movies (
    id serial,
    title varchar,
    year int,
    genre varchar,
    score int,
    director_id int REFERENCES directors(id),
    actor_id int REFERENCES actors(id),
    writer_id int REFERENCES writers(id)
);

INSERT INTO writers 
(name, email )
VALUES
	('Arthur C Clarke', 'arthur@clarke.com'),
  ('George Lucas', 'george@email.com'),
  ('Harper Lee', 'harper@lee.com'),
  ('James Cameron', 'james@cameroon.com'),
  ('Boris Pasternak', 'boris@boris.com'),
  ('Frederick Frank', 'fred@frank.com'),
  ('Theodoros Angelopoulos', 'theo@angelopoulos.com'),
  ('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'),
  ('Krzysztof Kieslowski', 'email@email.com'),
  ('Edmond Rostand', 'edmond@rostand.com');

INSERT INTO actors(
  	name, dob
  	)
  	VALUES
  	('Keir Dullea', '1936-05-30'),
    ('Mark Hamill', '1951-09-25'),
    ('Gregory Peck', '1916-04-05'),
    ('Leonardo DiCaprio', '1974-11-11'),
    ('Julie Chrisie', '1940-04-14'),
    ('Charlton Heston', '1923-10-04'),
    ('Manos Katrakis', '1908-08-14'),
    ('Rutger Hauer', '1944-01-23'),
    ('Juliette Binoche', '1964-03-09'),
    ('Gerard Depardieu', '1948-12-27');
    
INSERT INTO directors(
  	name, country
  	)
  	VALUES
  	('Stanley Kubrick', 'USA'),
    ('George Lucas', 'USA'),
    ('Robert Mulligan', 'USA'),
    ('James Cameron', 'Canada'),
    ('David Lean', 'UK'),
    ('Anthony Mann', 'USA'),
    ('Theodoros Angelopoulos', 'Greece'),
    ('Paul Verhoeven', 'Netherlands'),
    ('Krzysztof Kieslowski', 'Poland'),
    ('Jean-Paul Rappeneau', 'France');



SELECT title, directors.name as director_name from movies
    JOIN directors on director_id = directors.id;


SELECT title, directors.name as director_name, actors.name as star_name from movies
    JOIN actors on star_id = actors.id
    JOIN directors on director_id = directors.id;

SELECT title, directors.name as director_name, writers.name as     writer_name from movies
    JOIN writers on writer_id = writers.id
    JOIN directors on director_id = directors.id
    WHERE writers.name = directors.name;

SELECT title, directors.name as director_name from movies
    JOIN directors on director_id = directors.id
    WHERE score >= 8;

SELECT title, directors.country AS country from movies
    JOIN directors on director_id = directors.id
    WHERE country = 'USA';




    /*
        Finds all movies with an american director that have a score of 7 or higher
    */
    SELECT title, directors.name as director_name, directors.country as director_country, score from movies
	    JOIN directors on director_id = directors.id
	    WHERE score >= 7 AND directors.country = 'USA';

    /*
        Queries for the same table as the table given in core. The names in the colomns are not always the same
    */
    SELECT title, directors.name AS director_name, directors.country AS director_country,
	    actors.name AS star_name, actors.dob AS star_dob, writers.name AS writer_name,
        writers.email AS writer_email, year, genre, score FROM movies
  	        JOIN directors ON director_id = directors.id
            JOIN actors ON actor_id = actors.id
            JOIN writers ON writer_id = writers.id;

    /*
        Queries for the title of movies and the info for their star-actor
    */
    SELECT title, actors.name AS star_name, actors.dob AS star_dob FROM movies
        JOIN actors ON actor_id = actors.id;

    /*
        Queries for movies that had stars below the age of 40 upon release
    */
    SELECT title, actors.name AS star_name, year-extract(year FROM actors.dob) as star_age FROM movies
        JOIN actors ON actor_id = actors.id
        WHERE year-extract(year FROM actors.dob) <= 40;
    /*
        Queries for title, name of star, age of star and director for movies with star actors below the age of 30 upon release
    */
    SELECT title, actors.name AS star_name, year-extract(year FROM actors.dob) as star_age, directors.name as director_name FROM movies
        JOIN actors ON actor_id = actors.id
        JOIN directors ON director_id = directors.id
        WHERE year-extract(year FROM actors.dob) <= 30;



CREATE TABLE persons(
            id serial PRIMARY KEY,
            name varchar
            );
            
            
INSERT INTO persons
(name)
VALUES 
    ('Stanley Kubrick'),
    ('George Lucas'),
    ('Robert Mulligan'),
    ('James Cameron'),
    ('David Lean'),
    ('Anthony Mann'),
    ('Theodoros Angelopoulos'),
    ('Paul Verhoeven'),
    ('Krzysztof Kieslowski'),
    ('Jean-Paul Rappeneau'),
    ('Arthur C Clarke'),
    ('Harper Lee'),
    ('Boris Pasternak'),
    ('Frederick Frank'),
    ('Erik Hazelhoff Roelfzemal'),
    ('Edmond Rostand'),
    ('Keir Dullea'),
    ('Mark Hamill'),
    ('Gregory Peck'),
    ('Leonardo DiCaprio'),
    ('Julie Chrisie'),
    ('Charlton Heston'),
    ('Manos Katrakis'),
    ('Rutger Hauer'),
    ('Juliette Binoche'),
    ('Gerard Depardieu');


    /*
    Droping for refactoring tables
    */
	DROP table movies;
	DROP table actors, directors, writers;
    
    /*
    Creating new tables with new persons
    */

    CREATE TABLE directors(
        id serial PRIMARY KEY,
        person_id int REFERENCES persons(id),
        country varchar
        );

    CREATE TABLE writers(
        id serial PRIMARY KEY,
        person_id int REFERENCES persons(id),
        email varchar
        );

    CREATE TABLE actors(
        id serial PRIMARY KEY,
        person_id int REFERENCES persons(id),
        dob date
        );

    CREATE TABLE movies(
        id serial PRIMARY KEY,
        title varchar,
        year int,
        genre varchar,
        score int,
        director_id int REFERENCES directors(id),
        actor_id int REFERENCES actors(id),
        writer_id int REFERENCES writers(id)
        );

    /*
    Populating directors, writers, actors
    */
      
    INSERT INTO directors
  	    (person_id, country)
  	    VALUES
  	    (1, 'USA'),
        (2, 'USA'),
        (3, 'USA'),
        (4, 'Canada'),
        (5, 'UK'),
        (6, 'USA'),
        (7, 'Greece'),
        (8, 'Netherlands'),
        (9, 'Poland'),
        (10, 'France');

    INSERT INTO actors
  	    (person_id, dob)
        VALUES
        (17, '1936-05-30'),
        (18, '1951-09-25'),
        (19, '1916-04-05'),
        (20, '1974-11-11'),
        (21, '1940-04-14'),
        (22, '1923-10-04'),
        (23, '1908-08-14'),
        (24, '1944-01-23'),
        (25, '1964-03-09'),
        (26, '1948-12-27');
  
    INSERT INTO writers
  	    (person_id, email)
        VALUES
        (11, 'arthur@clarke.com'),
        (2, 'george@email.com'),
        (12, 'harper@lee.com'),
        (4, 'james@cameroon.com'),
        (13, 'boris@boris.com'),
        (14, 'fred@frank.com'),
        (7, 'theo@angelopoulos.com'),
        (15, 'erik@roelfzema.com'),
        (9, 'email@email.com'),
        (16, 'edmond@rostand.com');
    

