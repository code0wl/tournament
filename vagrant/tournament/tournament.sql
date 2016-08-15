-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament

DROP VIEW IF EXISTS standings;
DROP VIEW IF EXISTS players_wins;
DROP VIEW IF EXISTS players_loses;
DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS players;

CREATE TABLE players (
    name TEXT,
    ID   SERIAL,
    PRIMARY KEY (ID)
);

CREATE TABLE matches (
    ID_winner INT REFERENCES players (ID),
    ID_loser  INT REFERENCES players (ID),
    match_ID  SERIAL,
    PRIMARY KEY (match_ID)
);

CREATE VIEW players_loses AS
    SELECT
        players.id                   AS ID,
        COALESCE(count(ID_loser), 0) AS times
    FROM players
        LEFT JOIN matches
            ON players.id = matches.ID_loser
    GROUP BY players.id
    ORDER BY times DESC;

CREATE VIEW players_wins AS
    SELECT
        players.id                    AS ID,
        COALESCE(count(ID_winner), 0) AS times
    FROM players
        LEFT JOIN matches
            ON players.id = matches.ID_winner
    GROUP BY players.id
    ORDER BY times DESC;


CREATE VIEW standings AS
    SELECT
        players_wins.ID                          AS ID,
        name,
        players_wins.times                       AS wins,
        players_loses.times + players_wins.times AS matches
    FROM players, players_loses, players_wins
    WHERE players.ID = players_wins.ID AND players_loses.ID = players_wins.ID
    ORDER BY wins DESC;
