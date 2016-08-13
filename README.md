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
  ID serial PRIMARY KEY,
  player_name varchar(255)
);

CREATE TABLE matches (
  ID serial PRIMARY KEY,
  player1 integer references Players(ID),
  player2 integer references Players(ID),
  winner integer references Players(ID)
);
```

#### Import Functions

To use the tournament functions, import tournament.py into your python script.

import tournament

#### Use Functions

The following functions are included in tournament.py for you to use in running a swiss-system tournament.

connect()

Connects to the PostgreSQL database and returns a database connection.

deleteMatches()

Remove all match records from the database.

deletePlayers()

Remove all player records from the database.

countPlayers()

Returns the number of players currently registered in the tournament.

registerPlayer(name)

Adds a player to the tournament database (can be any name - individuals or teams). The database assigns a unique serial id number for each player. The name used does not have to be unique.

playerStandings()

Returns a list of the players and their win records, sorted by wins. Therefore, the first entry is the player in first place or a player tied for first place if there is currently a tie. The returned list of tuples each contains the player's id, name, matches won, and number of matches played by the player).

reportMatch(winner, loser)

Creates a new match record, recording the winner and the loser of the match. The arguments for the winner and the loser must be the id numbers for each player.

swissPairings()

Returns a list containing pairs of players for the next round of the tournament. The function assumes an even number of players registered and pairs players based on an equal or nearly-equal win record (i.e., it pairs players who are adjacent in the standings). The returned list of tuples each contain the id and name of both paired players (id1, name1, id2, name2).
