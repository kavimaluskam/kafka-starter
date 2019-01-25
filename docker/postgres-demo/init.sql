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
  (default, 'Lissi', 'Andrea', 'landrea9@gizmodo.com'),
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
  (default, 106, 3, 5, '2019-01-04 12:38:59'),
  (default, 102, 1, 2, '2019-01-04 15:00:41'),
  (default, 105, 2, 5, '2019-01-04 17:01:38'),
  (default, 105, 1, 4, '2019-01-04 18:20:03'),
  (default, 101, 10, 5, '2019-01-05 15:48:02'),
  (default, 105, 5, 4, '2019-01-05 18:09:11'),
  (default, 105, 4, 5, '2019-01-05 18:30:43'),
  (default, 102, 2, 2, '2019-01-05 21:46:42'),
  (default, 105, 3, 5, '2019-01-06 09:19:38'),
  (default, 108, 8, 5, '2019-01-06 16:36:04'),
  (default, 102, 9, 5, '2019-01-06 18:44:50'),
  (default, 104, 7, 4, '2019-01-07 10:43:49'),
  (default, 110, 7, 3, '2019-01-08 09:39:27'),
  (default, 104, 1, 3, '2019-01-08 19:09:56'),
  (default, 101, 7, 3, '2019-01-08 20:35:18'),
  (default, 101, 3, 5, '2019-01-08 20:36:29'),
  (default, 102, 8, 3, '2019-01-09 08:14:39'),
  (default, 109, 3, 4, '2019-01-09 12:45:54'),
  (default, 107, 2, 5, '2019-01-09 15:33:08'),
  (default, 107, 8, 4, '2019-01-09 21:27:31'),
  (default, 110, 3, 3, '2019-01-10 08:53:48'),
  (default, 106, 2, 4, '2019-01-10 19:38:23'),
  (default, 109, 7, 3, '2019-01-10 19:55:09'),
  (default, 108, 5, 3, '2019-01-11 08:36:03'),
  (default, 109, 5, 5, '2019-01-11 08:38:15'),
  (default, 103, 6, 2, '2019-01-11 09:12:34'),
  (default, 107, 3, 5, '2019-01-11 13:11:01'),
  (default, 108, 4, 4, '2019-01-11 13:45:50'),
  (default, 106, 10, 2, '2019-01-12 09:20:07'),
  (default, 107, 1, 4, '2019-01-12 15:32:31'),
  (default, 106, 8, 2, '2019-01-13 13:53:28'),
  (default, 110, 5, 2, '2019-01-14 11:20:46'),
  (default, 103, 9, 4, '2019-01-14 17:17:26'),
  (default, 106, 6, 2, '2019-01-15 10:33:34'),
  (default, 109, 9, 2, '2019-01-16 09:23:05'),
  (default, 104, 3, 2, '2019-01-16 15:12:15'),
  (default, 107, 6, 5, '2019-01-16 17:49:51'),
  (default, 108, 6, 5, '2019-01-17 09:26:15'),
  (default, 104, 6, 2, '2019-01-17 09:46:06'),
  (default, 110, 1, 3, '2019-01-17 15:04:50'),
  (default, 101, 8, 3, '2019-01-17 19:50:01'),
  (default, 104, 2, 4, '2019-01-18 11:42:35'),
  (default, 104, 9, 4, '2019-01-18 12:00:34'),
  (default, 103, 8, 5, '2019-01-19 09:43:32'),
  (default, 102, 7, 3, '2019-01-19 14:26:57'),
  (default, 104, 8, 3, '2019-01-20 10:49:10'),
  (default, 105, 9, 4, '2019-01-20 17:50:24'),
  (default, 105, 10, 5, '2019-01-21 12:54:56'),
  (default, 106, 9, 3, '2019-01-21 15:01:28'),
  (default, 107, 10, 3, '2019-01-21 17:25:15');
