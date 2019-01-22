-- Demo application users
CREATE TABLE users (
  id SERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(127) NOT NULL,
  last_name VARCHAR(127) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE
);

ALTER SEQUENCE users_id_seq RESTART WITH 101;

INSERT INTO users
VALUES
  (default, 'Cass', 'Truss', 'ctruss0@salon.com'),
  (default, 'Joete', 'Scowcroft', 'jscowcroft1@gizmodo.com'),
  (default, 'Celine', 'Wortley', 'cwortley2@bizjournals.com'),
  (default, 'Othilia', 'Gumme', 'ogumme3@issuu.com'),
  (default, 'Maynord', 'Buttrick', 'mbuttrick4@mashable.com'),
  (default, 'Kendall', 'Yitzovitz', 'kyitzovitz5@storify.com'),
  (default, 'Tedi', 'Danne', 'tdanne6@earthlink.net'),
  (default, 'Diena', 'Knight', 'dknight7@cbsnews.com'),
  (default, 'Court', 'Hensmans', 'chensmans8@over-blog.com'),
  (default, 'Lissi', 'D', 'Andrea	ldandrea9@gizmodo.com'),
  (default, 'Abie', 'Fendlen', 'afendlena@independent.co.uk'),
  (default, 'Pall', 'Fey', 'pfeyb@slate.com'),
  (default, 'Freedman', 'Rafe', 'frafec@desdev.cn'),
  (default, 'Ardith', 'Tebbett', 'atebbettd@artisteer.com'),
  (default, 'Nolan', 'Jewel', 'njewele@wisc.edu'),
  (default, 'Bowie', 'Elgood', 'belgoodf@nps.gov'),
  (default, 'Normie', 'Brotheridge', 'nbrotheridgeg@goodreads.com'),
  (default, 'Larry', 'Simioli', 'lsimiolih@feedburner.com'),
  (default, 'Abbye', 'Garham', 'agarhami@noaa.gov'),
  (default, 'Phip', 'Shimwell', 'pshimwellj@netlog.com');

-- Demo movie records
CREATE TABLE movies (
  id SERIAL NOT NULL PRIMARY KEY,
  movie_title VARCHAR(127) NOT NULL,
  movie_genres VARCHAR(127) NOT NULL,
  release_year INTEGER NOT NULL
);

INSERT INTO movies
VALUES
  (default, 'Billabong Odyssey', 'Documentary', 2010),
  (default, 'Grease 2', 'Comedy|Musical|Romance', 1998),
  (default, 'Weight of Water', 'Thriller', 2007),
  (default, 'In Dreams', 'Horror|Thriller', 1998),
  (default, 'Hulk', 'Action|Adventure|Sci-Fi', 1995),
  (default, 'Glass Key', 'Crime|Drama|Film-Noir|Mystery', 2003),
  (default, 'And While We Were Here', 'Drama', 2007),
  (default, 'Castle of Blood', 'Horror', 2008),
  (default, 'Bill Bailey: Tinselworm', 'Comedy|Documentary', 2012),
  (default, 'Slave Girls (Prehistoric Women)', 'Adventure|Fantasy', 2000);

-- Demo rating records
CREATE TABLE ratings (
  id SERIAL NOT NULL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  movie_id INTEGER NOT NULL,
  rating INTEGER NOT NULL,
  create_time TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  UNIQUE (user_id, movie_id)
);

INSERT INTO ratings
VALUES
  (default, 116, 9, 4, '2019-01-13 13:53:28'),
  (default, 110, 7, 2, '2019-01-14 11:20:46'),
  (default, 108, 6, 2, '2019-01-14 17:17:26'),
  (default, 108, 8, 3, '2019-01-15 10:33:34'),
  (default, 119, 4, 3, '2019-01-16 09:23:05'),
  (default, 108, 7, 3, '2019-01-16 15:12:15'),
  (default, 120, 10, 3, '2019-01-16 17:49:51'),
  (default, 106, 5, 3, '2019-01-17 09:26:15'),
  (default, 103, 5, 2, '2019-01-17 09:46:06'),
  (default, 109, 5, 2, '2019-01-17 15:04:50'),
  (default, 120, 3, 4, '2019-01-17 19:50:01'),
  (default, 115, 7, 3, '2019-01-18 11:42:35'),
  (default, 102, 3, 3, '2019-01-18 12:00:34'),
  (default, 107, 8, 3, '2019-01-19 09:43:32'),
  (default, 114, 2, 3, '2019-01-19 14:26:57'),
  (default, 102, 6, 4, '2019-01-20 10:49:10'),
  (default, 115, 1, 4, '2019-01-20 17:50:24'),
  (default, 106, 4, 3, '2019-01-21 12:54:56'),
  (default, 111, 5, 2, '2019-01-21 15:01:28'),
  (default, 105, 6, 2, '2019-01-21 17:25:15');
