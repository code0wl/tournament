# Udacity-Tournament-Database

Udacity-tournament-database is a simple database project completed for Udacity's full-stack nanodegree program program. The project demonstrates the design and use of a PostgreSQL database to manage a swiss-system tournament, which is a non-elimination tournament system used in certain sport and game competitions.

###Documentation

To use the project files to setup a swiss-system tournament, follow the below steps.

#### Download or clone files

#### Create Database

Log into your Postgres console and create a new database:
CREATE DATABASE tournament and run tests by following these instructions:

####After following the guidelines in project description and setting up the environment and vagrant vm using vagrant up followed by vagrant ssh
1. Navigate to tournament project folder cd /vagrant/tournament
1. Write psql to go to PostgreSQL
1. Run \i tournament.sql to create and import the tournament database schema.
1. Once the database has been setup, quit the PostgreSQL interface using \q
1. Execute the following command python tournament_test.py to test the methods implemented in tournament.py
1. Test results will be printed on the screen.

