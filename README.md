# Udacity-Tournament-Database

Udacity-tournament-database is a simple database project completed for Udacity's full-stack nanodegree program program. The project demonstrates the design and use of a PostgreSQL database to manage a swiss-system tournament, which is a non-elimination tournament system used in certain sport and game competitions.

###Documentation

To use the project files to setup a swiss-system tournament, follow the below steps.

#### Download or clone files

#### Create Database

Log into your Postgres console and create a new database:
CREATE DATABASE tournament

#### Create Tables

Two database tables will be required and are in database sql.
```
CREATE TABLE players (
    name TEXT,
    ID   SERIAL,
    PRIMARY KEY (ID)
);

CREATE TABLE matches (
    ID_winner SERIAL REFERENCES players (ID),
    ID_loser  SERIAL REFERENCES players (ID),
    match_ID  SERIAL,
    result    INT,
    PRIMARY KEY (match_ID)
);
```

#### CLI test
##### Make sure database exists
```
vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ psql
psql (9.3.5)
Type "help" for help.

vagrant=> CREATE DATABASE tournament;
CREATE DATABASE
vagrant=> \q
```

Make sure vagrant is running correctly and then run the following command to run the tests
ssh into your vagrant environment and navigate to vagrant/tournament. After that run the following command
- important: Make sure you are running python 3 and not 2
```
python tournament_test.py
```

