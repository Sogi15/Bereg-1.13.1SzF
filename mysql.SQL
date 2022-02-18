CREATE DATABASE IF NOT EXISTS BowlingLeagueExample;

USE BowlingLeagueExample;

CREATE TABLE Bowler_Scores (
	MatchID smallint NOT NULL ,
	GameNumber smallint NOT NULL ,
	BowlerID smallint NOT NULL ,
	RawScore smallint NULL ,
	HandiCapScore smallint NULL ,
	WonGame tinyint(1) NOT NULL
);

CREATE TABLE Bowlers (
	BowlerID smallint NOT NULL ,
	BowlerLastName nvarchar (50) NULL ,
	BowlerFirstName nvarchar (50) NULL ,
	BowlerMiddleInit nvarchar (1) NULL ,
	BowlerAddress nvarchar (50) NULL ,
	BowlerCity nvarchar (50) NULL ,
	BowlerState nvarchar (2) NULL ,
	BowlerZip nvarchar (10) NULL ,
	BowlerPhoneNumber nvarchar (14) NULL ,
	TeamID smallint NULL
);


CREATE TABLE Match_Games (
	MatchID smallint NOT NULL ,
	GameNumber smallint NOT NULL ,
	WinningTeamID smallint NULL
);


CREATE TABLE Teams (
	TeamID smallint NOT NULL ,
	TeamName nvarchar (50) NOT NULL ,
	CaptainID smallint
);


CREATE TABLE Tournaments (
	TourneyID smallint NOT NULL ,
	TourneyDate datetime NULL ,
	TourneyLocation nvarchar (50) NULL
);


CREATE TABLE Tourney_Matches (
	MatchID smallint NOT NULL ,
	TourneyID smallint NULL ,
	Lanes nvarchar (5) NULL ,
	OddLaneTeamID smallint NULL ,
	EvenLaneTeamID smallint NULL
);


ALTER TABLE Bowler_Scores ADD CONSTRAINT Bowler_Scores_PK PRIMARY KEY USING BTRee (MatchID, GameNumber, BowlerID);


CREATE  INDEX BowlerID ON Bowler_Scores(BowlerID);


CREATE  INDEX BowlersBowlerScores ON Bowler_Scores(BowlerID);


CREATE  INDEX MatchGamesBowlerScores ON Bowler_Scores(MatchID, GameNumber);


ALTER TABLE Bowlers ADD CONSTRAINT Bowlers_PK PRIMARY KEY (BowlerID);


CREATE  INDEX BowlerLastName ON Bowlers(BowlerLastName);


CREATE  INDEX BowlersTeamID ON Bowlers(TeamID);


CREATE  INDEX TeamsBowlers ON Bowlers(TeamID);


ALTER TABLE Match_Games ADD CONSTRAINT Match_Games_PK PRIMARY KEY (MatchID, GameNumber);


CREATE  INDEX Team1ID ON Match_Games(WinningTeamID);


CREATE  INDEX TourneyMatchesMatchGames ON Match_Games(MatchID);


ALTER TABLE Teams ADD CONSTRAINT Teams_PK PRIMARY KEY(TeamID);


CREATE  UNIQUE  INDEX BowlersTeams ON Teams(CaptainID);


CREATE  UNIQUE  INDEX CaptainID ON Teams(CaptainID);


CREATE  UNIQUE  INDEX TeamID ON Teams(TeamID);


ALTER TABLE Tournaments ADD CONSTRAINT aaaaaTournaments_PK PRIMARY KEY (TourneyID);


ALTER TABLE Tourney_Matches ADD CONSTRAINT Tourney_Matches_PK PRIMARY KEY (MatchID);


CREATE  INDEX Team1ID ON Tourney_Matches (OddLaneTeamID);


CREATE  INDEX Team2ID ON Tourney_Matches (EvenLaneTeamID);


CREATE  INDEX TeamsTourney_Matches ON Tourney_Matches (EvenLaneTeamID);


CREATE  INDEX TeamsTourneyMatches ON Tourney_Matches (OddLaneTeamID);


CREATE  INDEX TournamentsTourneyMatches ON Tourney_Matches (TourneyID);


CREATE  INDEX TourneyID ON Tourney_Matches(TourneyID);


ALTER TABLE Bowler_Scores ADD CONSTRAINT Bowler_Scores_FK00 FOREIGN KEY (BowlerID) REFERENCES Bowlers (BowlerID);


ALTER TABLE Bowler_Scores ADD	CONSTRAINT Bowler_Scores_FK01 FOREIGN KEY (MatchID, GameNumber) REFERENCES Match_Games (MatchID, GameNumber);


ALTER TABLE Bowlers ADD CONSTRAINT Bowlers_FK00 FOREIGN KEY (TeamID) REFERENCES Teams (TeamID);


ALTER TABLE Match_Games ADD CONSTRAINT Match_Games_FK00 FOREIGN KEY (MatchID) REFERENCES Tourney_Matches (MatchID);

ALTER TABLE Tourney_Matches ADD CONSTRAINT Tourney_Matches_FK00 FOREIGN KEY (EvenLaneTeamID) REFERENCES Teams (TeamID);

ALTER TABLE Tourney_Matches ADD CONSTRAINT Tourney_Matches_FK01 FOREIGN KEY (OddLaneTeamID) REFERENCES Teams (TeamID);

ALTER TABLE Teams ADD CONSTRAINT Teams_FK00 FOREIGN KEY (CaptainID) REFERENCES Bowlers (BowlerID);

ALTER TABLE Tourney_Matches ADD CONSTRAINT Tourney_Matches_FK02 FOREIGN KEY (TourneyID) REFERENCES Tournaments (TourneyID);

USE BowlingLeagueExample;
INSERT INTO Tournaments
  VALUES (1, '2007-09-04', 'Red Rooster Lanes');
INSERT INTO Tournaments
  VALUES (2, '2007-09-11', 'Thunderbird Lanes');
INSERT INTO Tournaments
  VALUES (3, '2007-09-18', 'Bolero Lanes');
INSERT INTO Tournaments
  VALUES (4, '2007-09-25', 'Imperial Lanes');
INSERT INTO Tournaments
  VALUES (5, '2007-10-02', 'Sports World Lanes');
INSERT INTO Tournaments
  VALUES (6, '2007-10-09', 'Totem Lanes');
INSERT INTO Tournaments
  VALUES (7, '2007-10-16', 'Acapulco Lanes');
INSERT INTO Tournaments
  VALUES (8, '2007-10-23', 'Red Rooster Lanes');
INSERT INTO Tournaments
  VALUES (9, '2007-10-30', 'Thunderbird Lanes');
INSERT INTO Tournaments
  VALUES (10, '2007-11-06', 'Bolero Lanes');
INSERT INTO Tournaments
  VALUES (11, '2007-11-13', 'Imperial Lanes');
INSERT INTO Tournaments
  VALUES (12, '2007-11-20', 'Sports World Lanes');
INSERT INTO Tournaments
  VALUES (13, '2007-11-27', 'Totem Lanes');
INSERT INTO Tournaments
  VALUES (14, '2007-12-04', 'Acapulco Lanes');
INSERT INTO Tournaments
  VALUES (15, '2008-07-11', 'Red Rooster Lanes');
INSERT INTO Tournaments
  VALUES (16, '2008-07-18', 'Thunderbird Lanes');
INSERT INTO Tournaments
  VALUES (17, '2008-07-25', 'Bolero Lanes');
INSERT INTO Tournaments
  VALUES (18, '2008-08-01', 'Sports World Lanes');
INSERT INTO Tournaments
  VALUES (19, '2008-08-08', 'Imperial Lanes');
INSERT INTO Tournaments
  VALUES (20, '2008-08-15', 'Totem Lanes');
INSERT INTO Teams
  VALUES (1, 'Marlins', Null);
INSERT INTO Teams
  VALUES (2, 'Sharks', Null);
INSERT INTO Teams
  VALUES (3, 'Terrapins', Null);
INSERT INTO Teams
  VALUES (4, 'Barracudas', Null);
INSERT INTO Teams
  VALUES (5, 'Dolphins', Null);
INSERT INTO Teams
  VALUES (6, 'Orcas', Null);
INSERT INTO Teams
  VALUES (7, 'Manatees', Null);
INSERT INTO Teams
  VALUES (8, 'Swordfish', Null);
INSERT INTO Teams
  VALUES (9, 'Huckleberrys', Null);
INSERT INTO Teams
  VALUES (10, 'MintJuleps', Null);
INSERT INTO Bowlers
  VALUES (1, 'Fournier', 'Barbara', NULL, '67 Willow Drive', 
   'Bothell', 'WA', '98123', '(206) 555-9876', 1);
INSERT INTO Bowlers
  VALUES (2, 'Fournier', 'David', NULL, '67 Willow Drive', 
   'Bothell', 'WA', '98123', '(206) 555-9876', 1);
INSERT INTO Bowlers
  VALUES (3, 'Kennedy', 'John', 'A', '2957 W 33rd', 
   'Ballard', 'WA', '98099', '(206) 555-7854', 1);
INSERT INTO Bowlers
  VALUES (4, 'Sheskey', 'Sara', 'J', '17950 N 59th', 
   'Seattle', 'WA', '98011', '(206) 555-9893', 1);
INSERT INTO Bowlers
  VALUES (5, 'Patterson', 'Ann', 'K', '16 Maple Lane', 
   'Auburn', 'WA', '98002', '(206) 555-3487', 2);
INSERT INTO Bowlers
  VALUES (6, 'Patterson', 'Neil', NULL, '16 Maple Lane', 
   'Auburn', 'WA', '98002', '(206) 555-3487', 2);
INSERT INTO Bowlers
  VALUES (7, 'Viescas', 'David', 'A', '16679 NE 42nd Court', 
   'Redmond', 'WA', '98052', '(206) 882-8878', 2);
INSERT INTO Bowlers
  VALUES (8, 'Viescas', 'Stephanie', NULL, '16679 NE 42nd Court', 
   'Redmond', 'WA', '98052', '(206) 882-8878', 2);
INSERT INTO Bowlers
  VALUES (9, 'Black', 'Alastair', NULL, '4726 - 11th Ave. N.E.', 
   'Seattle', 'WA', '98105', '(206) 555-1189', 3);
INSERT INTO Bowlers
  VALUES (10, 'Cunningham', 'David', NULL, '4110 Old Redmond Rd.', 
   'Redmond', 'WA', '98052', '(206) 555-8122', 3);
INSERT INTO Bowlers
  VALUES (11, 'Kennedy', 'Angel', NULL, '2957 W 33rd', 
   'Ballard', 'WA', '98099', '(206) 555-7854', 3);
INSERT INTO Bowlers
  VALUES (12, 'Viescas', 'Carol', 'M', '16345 NE 32nd Street', 
   'Bellevue', 'WA', '98004', '(206) 555-7295', 3);
INSERT INTO Bowlers
  VALUES (13, 'Hallmark', 'Elizabeth', NULL, 'Route 2, Box 203B', 
   'Woodinville', 'WA', '98072', '(206) 555-8990', 
   4);
INSERT INTO Bowlers
  VALUES (14, 'Hallmark', 'Gary', NULL, 'Route 2, Box 203B', 
   'Woodinville', 'WA', '98072', '(206) 555-8990', 
   4);
INSERT INTO Bowlers
  VALUES (15, 'Patterson', 'Kathryn', NULL, '16 Maple Lane', 
   'Auburn', 'WA', '98002', '(206) 555-3487', 4);
INSERT INTO Bowlers
  VALUES (16, 'Sheskey', 'Richard', NULL, '17950 N 59th', 
   'Seattle', 'WA', '98011', '(206) 555-9893', 4);
INSERT INTO Bowlers
  VALUES (17, 'Hernandez', 'Kendra', NULL, '47 Harvard Drive', 
   'Kirkland', 'WA', '98033', '(206) 889-9191', 5);
INSERT INTO Bowlers
  VALUES (18, 'Hernandez', 'Michael', NULL, '47 Harvard Drive', 
   'Kirkland', 'WA', '98033', '(206) 889-9191', 5);
INSERT INTO Bowlers
  VALUES (19, 'Viescas', 'John', 'L', '218 Main Street', 
   'Redmond', 'WA', '98052', '(206) 881-5596', 5);
INSERT INTO Bowlers
  VALUES (20, 'Viescas', 'Suzanne', 'L', '218 Main Street', 
   'Redmond', 'WA', '98052', '(206) 881-5596', 5);
INSERT INTO Bowlers
  VALUES (21, 'Ehrlich', 'Zachary', NULL, '507 - 20th Ave. E.', 
   'Seattle', 'WA', '98122', '(206) 555-9857', 6);
INSERT INTO Bowlers
  VALUES (22, 'Hallmark', 'Alaina', NULL, 'Route 2, Box 203B', 
   'Woodinville', 'WA', '98072', '(206) 555-8990', 
   6);
INSERT INTO Bowlers
  VALUES (23, 'Viescas', 'Caleb', NULL, '16679 NE 42nd Court', 
   'Redmond', 'WA', '98052', '(206) 882-8878', 6);
INSERT INTO Bowlers
  VALUES (24, 'Thompson', 'Sarah', 'L', '122 Spring Valley Drive', 
   'Duvall', 'WA', '98019', '(206) 555-8989', 6);
INSERT INTO Bowlers
  VALUES (25, 'Patterson', 'Megan', NULL, '16 Maple Lane', 
   'Auburn', 'WA', '98002', '(206) 555-3487', 7);
INSERT INTO Bowlers
  VALUES (26, 'Thompson', 'Mary', 'K', '122 Spring Valley Drive', 
   'Duvall', 'WA', '98019', '(206) 555-8989', 7);
INSERT INTO Bowlers
  VALUES (27, 'Thompson', 'William', 'G', '122 Spring Valley Drive', 
   'Duvall', 'WA', '98019', '(206) 555-8989', 7);
INSERT INTO Bowlers
  VALUES (28, 'Viescas', 'Michael', 'L', '218 Main Street', 
   'Redmond', 'WA', '98052', '(206) 881-5596', 7);
INSERT INTO Bowlers
  VALUES (29, 'Hallmark', 'Bailey', NULL, 'Route 2, Box 203B', 
   'Woodinville', 'WA', '98072', '(206) 555-8990', 
   8);
INSERT INTO Bowlers
  VALUES (30, 'Patterson', 'Rachel', NULL, '16 Maple Lane', 
   'Auburn', 'WA', '98002', '(206) 555-3487', 8);
INSERT INTO Bowlers
  VALUES (31, 'Pundt', 'Steve', NULL, '722 Moss Bay Blvd.', 
   'Kirkland', 'WA', '98033', '(206) 555-3412', 8);
INSERT INTO Bowlers
  VALUES (32, 'Rosales', 'Joe', NULL, '908 W. Capital Way', 
   'Tacoma', 'WA', '98401', '(206) 555-9482', 8);
UPDATE Teams SET CaptainID = 2 WHERE TeamID = 1;
UPDATE Teams SET CaptainID = 5 WHERE TeamID = 2;
UPDATE Teams SET CaptainID = 12 WHERE TeamID = 3;
UPDATE Teams SET CaptainID = 16 WHERE TeamID = 4;
UPDATE Teams SET CaptainID = 20 WHERE TeamID = 5;
UPDATE Teams SET CaptainID = 24 WHERE TeamID = 6;
UPDATE Teams SET CaptainID = 28 WHERE TeamID = 7;
UPDATE Teams SET CaptainID = 32 WHERE TeamID = 8;
UPDATE Teams SET CaptainID = 7 WHERE TeamID = 9;
UPDATE Teams SET CaptainID = 22 WHERE TeamID = 10;
INSERT INTO Tourney_Matches
  VALUES (1, 1, '01-02', 1, 2);
INSERT INTO Tourney_Matches
  VALUES (2, 1, '03-04', 3, 4);
INSERT INTO Tourney_Matches
  VALUES (3, 1, '05-06', 5, 6);
INSERT INTO Tourney_Matches
  VALUES (4, 1, '07-08', 7, 8);
INSERT INTO Tourney_Matches
  VALUES (5, 2, '21-22', 3, 1);
INSERT INTO Tourney_Matches
  VALUES (6, 2, '23-24', 4, 2);
INSERT INTO Tourney_Matches
  VALUES (7, 2, '25-26', 5, 7);
INSERT INTO Tourney_Matches
  VALUES (8, 2, '27-28', 8, 6);
INSERT INTO Tourney_Matches
  VALUES (9, 3, '15-16', 2, 3);
INSERT INTO Tourney_Matches
  VALUES (10, 3, '17-18', 1, 4);
INSERT INTO Tourney_Matches
  VALUES (11, 3, '19-20', 7, 6);
INSERT INTO Tourney_Matches
  VALUES (12, 3, '21-22', 5, 8);
INSERT INTO Tourney_Matches
  VALUES (13, 4, '09-10', 1, 5);
INSERT INTO Tourney_Matches
  VALUES (14, 4, '11-12', 2, 6);
INSERT INTO Tourney_Matches
  VALUES (15, 4, '13-14', 3, 7);
INSERT INTO Tourney_Matches
  VALUES (16, 4, '15-16', 4, 8);
INSERT INTO Tourney_Matches
  VALUES (17, 5, '11-12', 6, 1);
INSERT INTO Tourney_Matches
  VALUES (18, 5, '13-14', 5, 2);
INSERT INTO Tourney_Matches
  VALUES (19, 5, '15-16', 8, 3);
INSERT INTO Tourney_Matches
  VALUES (20, 5, '17-18', 7, 4);
INSERT INTO Tourney_Matches
  VALUES (21, 6, '05-06', 1, 7);
INSERT INTO Tourney_Matches
  VALUES (22, 6, '07-08', 3, 5);
INSERT INTO Tourney_Matches
  VALUES (23, 6, '09-10', 2, 8);
INSERT INTO Tourney_Matches
  VALUES (24, 6, '11-12', 4, 6);
INSERT INTO Tourney_Matches
  VALUES (25, 7, '13-14', 8, 1);
INSERT INTO Tourney_Matches
  VALUES (26, 7, '15-16', 7, 2);
INSERT INTO Tourney_Matches
  VALUES (27, 7, '17-18', 6, 3);
INSERT INTO Tourney_Matches
  VALUES (28, 7, '19-20', 5, 4);
INSERT INTO Tourney_Matches
  VALUES (29, 8, '21-22', 1, 3);
INSERT INTO Tourney_Matches
  VALUES (30, 8, '23-24', 2, 4);
INSERT INTO Tourney_Matches
  VALUES (31, 8, '25-26', 7, 5);
INSERT INTO Tourney_Matches
  VALUES (32, 8, '27-28', 6, 8);
INSERT INTO Tourney_Matches
  VALUES (33, 9, '15-16', 3, 2);
INSERT INTO Tourney_Matches
  VALUES (34, 9, '17-18', 4, 1);
INSERT INTO Tourney_Matches
  VALUES (35, 9, '19-20', 6, 7);
INSERT INTO Tourney_Matches
  VALUES (36, 9, '21-22', 8, 5);
INSERT INTO Tourney_Matches
  VALUES (37, 10, '09-10', 5, 1);
INSERT INTO Tourney_Matches
  VALUES (38, 10, '11-12', 6, 2);
INSERT INTO Tourney_Matches
  VALUES (39, 10, '13-14', 7, 3);
INSERT INTO Tourney_Matches
  VALUES (40, 10, '15-16', 8, 4);
INSERT INTO Tourney_Matches
  VALUES (41, 11, '11-12', 1, 6);
INSERT INTO Tourney_Matches
  VALUES (42, 11, '13-14', 2, 5);
INSERT INTO Tourney_Matches
  VALUES (43, 11, '15-16', 3, 8);
INSERT INTO Tourney_Matches
  VALUES (44, 11, '17-18', 4, 7);
INSERT INTO Tourney_Matches
  VALUES (45, 12, '05-06', 7, 1);
INSERT INTO Tourney_Matches
  VALUES (46, 12, '07-08', 5, 3);
INSERT INTO Tourney_Matches
  VALUES (47, 12, '09-10', 8, 2);
INSERT INTO Tourney_Matches
  VALUES (48, 12, '11-12', 6, 4);
INSERT INTO Tourney_Matches
  VALUES (49, 13, '13-14', 1, 8);
INSERT INTO Tourney_Matches
  VALUES (50, 13, '15-16', 2, 7);
INSERT INTO Tourney_Matches
  VALUES (51, 13, '17-18', 3, 6);
INSERT INTO Tourney_Matches
  VALUES (52, 13, '19-20', 4, 5);
INSERT INTO Tourney_Matches
  VALUES (53, 14, '01-02', 2, 1);
INSERT INTO Tourney_Matches
  VALUES (54, 14, '03-04', 4, 3);
INSERT INTO Tourney_Matches
  VALUES (55, 14, '05-06', 6, 5);
INSERT INTO Tourney_Matches
  VALUES (56, 14, '07-08', 8, 7);
INSERT INTO Tourney_Matches
  VALUES (57, 11, '19-20', 10, 9);
INSERT INTO Match_Games
  VALUES (1, 1, 1);
INSERT INTO Match_Games
  VALUES (1, 2, 2);
INSERT INTO Match_Games
  VALUES (1, 3, 1);
INSERT INTO Match_Games
  VALUES (2, 1, 3);
INSERT INTO Match_Games
  VALUES (2, 2, 4);
INSERT INTO Match_Games
  VALUES (2, 3, 3);
INSERT INTO Match_Games
  VALUES (3, 1, 5);
INSERT INTO Match_Games
  VALUES (3, 2, 6);
INSERT INTO Match_Games
  VALUES (3, 3, 5);
INSERT INTO Match_Games
  VALUES (4, 1, 7);
INSERT INTO Match_Games
  VALUES (4, 2, 8);
INSERT INTO Match_Games
  VALUES (4, 3, 7);
INSERT INTO Match_Games
  VALUES (5, 1, 3);
INSERT INTO Match_Games
  VALUES (5, 2, 1);
INSERT INTO Match_Games
  VALUES (5, 3, 3);
INSERT INTO Match_Games
  VALUES (6, 1, 4);
INSERT INTO Match_Games
  VALUES (6, 2, 2);
INSERT INTO Match_Games
  VALUES (6, 3, 4);
INSERT INTO Match_Games
  VALUES (7, 1, 5);
INSERT INTO Match_Games
  VALUES (7, 2, 7);
INSERT INTO Match_Games
  VALUES (7, 3, 5);
INSERT INTO Match_Games
  VALUES (8, 1, 8);
INSERT INTO Match_Games
  VALUES (8, 2, 6);
INSERT INTO Match_Games
  VALUES (8, 3, 8);
INSERT INTO Match_Games
  VALUES (9, 1, 2);
INSERT INTO Match_Games
  VALUES (9, 2, 3);
INSERT INTO Match_Games
  VALUES (9, 3, 2);
INSERT INTO Match_Games
  VALUES (10, 1, 1);
INSERT INTO Match_Games
  VALUES (10, 2, 4);
INSERT INTO Match_Games
  VALUES (10, 3, 1);
INSERT INTO Match_Games
  VALUES (11, 1, 7);
INSERT INTO Match_Games
  VALUES (11, 2, 6);
INSERT INTO Match_Games
  VALUES (11, 3, 7);
INSERT INTO Match_Games
  VALUES (12, 1, 5);
INSERT INTO Match_Games
  VALUES (12, 2, 8);
INSERT INTO Match_Games
  VALUES (12, 3, 5);
INSERT INTO Match_Games
  VALUES (13, 1, 1);
INSERT INTO Match_Games
  VALUES (13, 2, 5);
INSERT INTO Match_Games
  VALUES (13, 3, 1);
INSERT INTO Match_Games
  VALUES (14, 1, 2);
INSERT INTO Match_Games
  VALUES (14, 2, 6);
INSERT INTO Match_Games
  VALUES (14, 3, 2);
INSERT INTO Match_Games
  VALUES (15, 1, 3);
INSERT INTO Match_Games
  VALUES (15, 2, 7);
INSERT INTO Match_Games
  VALUES (15, 3, 3);
INSERT INTO Match_Games
  VALUES (16, 1, 4);
INSERT INTO Match_Games
  VALUES (16, 2, 8);
INSERT INTO Match_Games
  VALUES (16, 3, 4);
INSERT INTO Match_Games
  VALUES (17, 1, 6);
INSERT INTO Match_Games
  VALUES (17, 2, 1);
INSERT INTO Match_Games
  VALUES (17, 3, 6);
INSERT INTO Match_Games
  VALUES (18, 1, 5);
INSERT INTO Match_Games
  VALUES (18, 2, 2);
INSERT INTO Match_Games
  VALUES (18, 3, 5);
INSERT INTO Match_Games
  VALUES (19, 1, 8);
INSERT INTO Match_Games
  VALUES (19, 2, 3);
INSERT INTO Match_Games
  VALUES (19, 3, 8);
INSERT INTO Match_Games
  VALUES (20, 1, 7);
INSERT INTO Match_Games
  VALUES (20, 2, 4);
INSERT INTO Match_Games
  VALUES (20, 3, 7);
INSERT INTO Match_Games
  VALUES (21, 1, 1);
INSERT INTO Match_Games
  VALUES (21, 2, 7);
INSERT INTO Match_Games
  VALUES (21, 3, 1);
INSERT INTO Match_Games
  VALUES (22, 1, 3);
INSERT INTO Match_Games
  VALUES (22, 2, 5);
INSERT INTO Match_Games
  VALUES (22, 3, 3);
INSERT INTO Match_Games
  VALUES (23, 1, 2);
INSERT INTO Match_Games
  VALUES (23, 2, 8);
INSERT INTO Match_Games
  VALUES (23, 3, 2);
INSERT INTO Match_Games
  VALUES (24, 1, 4);
INSERT INTO Match_Games
  VALUES (24, 2, 6);
INSERT INTO Match_Games
  VALUES (24, 3, 4);
INSERT INTO Match_Games
  VALUES (25, 1, 8);
INSERT INTO Match_Games
  VALUES (25, 2, 1);
INSERT INTO Match_Games
  VALUES (25, 3, 8);
INSERT INTO Match_Games
  VALUES (26, 1, 7);
INSERT INTO Match_Games
  VALUES (26, 2, 2);
INSERT INTO Match_Games
  VALUES (26, 3, 7);
INSERT INTO Match_Games
  VALUES (27, 1, 6);
INSERT INTO Match_Games
  VALUES (27, 2, 3);
INSERT INTO Match_Games
  VALUES (27, 3, 6);
INSERT INTO Match_Games
  VALUES (28, 1, 5);
INSERT INTO Match_Games
  VALUES (28, 2, 4);
INSERT INTO Match_Games
  VALUES (28, 3, 5);
INSERT INTO Match_Games
  VALUES (29, 1, 1);
INSERT INTO Match_Games
  VALUES (29, 2, 3);
INSERT INTO Match_Games
  VALUES (29, 3, 1);
INSERT INTO Match_Games
  VALUES (30, 1, 2);
INSERT INTO Match_Games
  VALUES (30, 2, 4);
INSERT INTO Match_Games
  VALUES (30, 3, 2);
INSERT INTO Match_Games
  VALUES (31, 1, 7);
INSERT INTO Match_Games
  VALUES (31, 2, 5);
INSERT INTO Match_Games
  VALUES (31, 3, 7);
INSERT INTO Match_Games
  VALUES (32, 1, 6);
INSERT INTO Match_Games
  VALUES (32, 2, 8);
INSERT INTO Match_Games
  VALUES (32, 3, 6);
INSERT INTO Match_Games
  VALUES (33, 1, 3);
INSERT INTO Match_Games
  VALUES (33, 2, 2);
INSERT INTO Match_Games
  VALUES (33, 3, 3);
INSERT INTO Match_Games
  VALUES (34, 1, 4);
INSERT INTO Match_Games
  VALUES (34, 2, 1);
INSERT INTO Match_Games
  VALUES (34, 3, 4);
INSERT INTO Match_Games
  VALUES (35, 1, 6);
INSERT INTO Match_Games
  VALUES (35, 2, 7);
INSERT INTO Match_Games
  VALUES (35, 3, 6);
INSERT INTO Match_Games
  VALUES (36, 1, 8);
INSERT INTO Match_Games
  VALUES (36, 2, 5);
INSERT INTO Match_Games
  VALUES (36, 3, 8);
INSERT INTO Match_Games
  VALUES (37, 1, 5);
INSERT INTO Match_Games
  VALUES (37, 2, 1);
INSERT INTO Match_Games
  VALUES (37, 3, 5);
INSERT INTO Match_Games
  VALUES (38, 1, 6);
INSERT INTO Match_Games
  VALUES (38, 2, 2);
INSERT INTO Match_Games
  VALUES (38, 3, 6);
INSERT INTO Match_Games
  VALUES (39, 1, 7);
INSERT INTO Match_Games
  VALUES (39, 2, 3);
INSERT INTO Match_Games
  VALUES (39, 3, 7);
INSERT INTO Match_Games
  VALUES (40, 1, 8);
INSERT INTO Match_Games
  VALUES (40, 2, 4);
INSERT INTO Match_Games
  VALUES (40, 3, 8);
INSERT INTO Match_Games
  VALUES (41, 1, 1);
INSERT INTO Match_Games
  VALUES (41, 2, 6);
INSERT INTO Match_Games
  VALUES (41, 3, 1);
INSERT INTO Match_Games
  VALUES (42, 1, 2);
INSERT INTO Match_Games
  VALUES (42, 2, 5);
INSERT INTO Match_Games
  VALUES (42, 3, 2);
INSERT INTO Match_Games
  VALUES (43, 1, 3);
INSERT INTO Match_Games
  VALUES (43, 2, 8);
INSERT INTO Match_Games
  VALUES (43, 3, 3);
INSERT INTO Match_Games
  VALUES (44, 1, 4);
INSERT INTO Match_Games
  VALUES (44, 2, 7);
INSERT INTO Match_Games
  VALUES (44, 3, 4);
INSERT INTO Match_Games
  VALUES (45, 1, 7);
INSERT INTO Match_Games
  VALUES (45, 2, 1);
INSERT INTO Match_Games
  VALUES (45, 3, 7);
INSERT INTO Match_Games
  VALUES (46, 1, 5);
INSERT INTO Match_Games
  VALUES (46, 2, 3);
INSERT INTO Match_Games
  VALUES (46, 3, 5);
INSERT INTO Match_Games
  VALUES (47, 1, 8);
INSERT INTO Match_Games
  VALUES (47, 2, 2);
INSERT INTO Match_Games
  VALUES (47, 3, 8);
INSERT INTO Match_Games
  VALUES (48, 1, 6);
INSERT INTO Match_Games
  VALUES (48, 2, 4);
INSERT INTO Match_Games
  VALUES (48, 3, 6);
INSERT INTO Match_Games
  VALUES (49, 1, 1);
INSERT INTO Match_Games
  VALUES (49, 2, 8);
INSERT INTO Match_Games
  VALUES (49, 3, 1);
INSERT INTO Match_Games
  VALUES (50, 1, 2);
INSERT INTO Match_Games
  VALUES (50, 2, 7);
INSERT INTO Match_Games
  VALUES (50, 3, 2);
INSERT INTO Match_Games
  VALUES (51, 1, 3);
INSERT INTO Match_Games
  VALUES (51, 2, 6);
INSERT INTO Match_Games
  VALUES (51, 3, 3);
INSERT INTO Match_Games
  VALUES (52, 1, 4);
INSERT INTO Match_Games
  VALUES (52, 2, 5);
INSERT INTO Match_Games
  VALUES (52, 3, 4);
INSERT INTO Match_Games
  VALUES (53, 1, 2);
INSERT INTO Match_Games
  VALUES (53, 2, 1);
INSERT INTO Match_Games
  VALUES (53, 3, 2);
INSERT INTO Match_Games
  VALUES (54, 1, 4);
INSERT INTO Match_Games
  VALUES (54, 2, 3);
INSERT INTO Match_Games
  VALUES (54, 3, 4);
INSERT INTO Match_Games
  VALUES (55, 1, 6);
INSERT INTO Match_Games
  VALUES (55, 2, 5);
INSERT INTO Match_Games
  VALUES (55, 3, 6);
INSERT INTO Match_Games
  VALUES (56, 1, 8);
INSERT INTO Match_Games
  VALUES (56, 2, 7);
INSERT INTO Match_Games
  VALUES (56, 3, 8);
INSERT INTO Bowler_Scores
  VALUES (1, 1, 1, 146, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (1, 1, 2, 166, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 1, 3, 140, 171, 0);
INSERT INTO Bowler_Scores
  VALUES (1, 1, 4, 146, 198, 0);
INSERT INTO Bowler_Scores
  VALUES (1, 1, 5, 157, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 1, 6, 160, 198, 0);
INSERT INTO Bowler_Scores
  VALUES (1, 1, 7, 170, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 1, 8, 150, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 2, 1, 146, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (1, 2, 2, 135, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (1, 2, 3, 156, 187, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 2, 4, 143, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 2, 5, 149, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 2, 6, 152, 190, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 2, 7, 158, 187, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 2, 8, 136, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (1, 3, 1, 153, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 3, 2, 177, 216, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 3, 3, 191, 222, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 3, 4, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (1, 3, 5, 139, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (1, 3, 6, 142, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (1, 3, 7, 192, 221, 0);
INSERT INTO Bowler_Scores
  VALUES (1, 3, 8, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (2, 1, 9, 146, 191, 1);
INSERT INTO Bowler_Scores
  VALUES (2, 1, 10, 154, 190, 1);
INSERT INTO Bowler_Scores
  VALUES (2, 1, 11, 168, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (2, 1, 12, 136, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (2, 1, 13, 143, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (2, 1, 14, 142, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (2, 1, 15, 137, 171, 0);
INSERT INTO Bowler_Scores
  VALUES (2, 1, 16, 143, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (2, 2, 9, 138, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (2, 2, 10, 171, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (2, 2, 11, 180, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (2, 2, 12, 145, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (2, 2, 13, 155, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (2, 2, 14, 166, 205, 0);
INSERT INTO Bowler_Scores
  VALUES (2, 2, 15, 155, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (2, 2, 16, 139, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (2, 3, 9, 161, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (2, 3, 10, 172, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (2, 3, 11, 186, 219, 1);
INSERT INTO Bowler_Scores
  VALUES (2, 3, 12, 136, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (2, 3, 13, 162, 205, 0);
INSERT INTO Bowler_Scores
  VALUES (2, 3, 14, 137, 176, 0);
INSERT INTO Bowler_Scores
  VALUES (2, 3, 15, 163, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (2, 3, 16, 143, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 1, 17, 159, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 1, 18, 176, 215, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 1, 19, 147, 176, 0);
INSERT INTO Bowler_Scores
  VALUES (3, 1, 20, 143, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 1, 21, 154, 201, 0);
INSERT INTO Bowler_Scores
  VALUES (3, 1, 22, 173, 211, 0);
INSERT INTO Bowler_Scores
  VALUES (3, 1, 23, 146, 178, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 1, 24, 164, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (3, 2, 17, 165, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 2, 18, 164, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 2, 19, 168, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (3, 2, 20, 137, 188, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 2, 21, 157, 204, 0);
INSERT INTO Bowler_Scores
  VALUES (3, 2, 22, 157, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (3, 2, 23, 182, 214, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 2, 24, 160, 188, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 3, 17, 149, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 3, 18, 160, 199, 0);
INSERT INTO Bowler_Scores
  VALUES (3, 3, 19, 185, 214, 0);
INSERT INTO Bowler_Scores
  VALUES (3, 3, 20, 141, 192, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 3, 21, 137, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (3, 3, 22, 180, 218, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 3, 23, 187, 219, 1);
INSERT INTO Bowler_Scores
  VALUES (3, 3, 24, 163, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 1, 25, 157, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (4, 1, 26, 143, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 1, 27, 140, 170, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 1, 28, 143, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 1, 29, 138, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 1, 30, 176, 215, 1);
INSERT INTO Bowler_Scores
  VALUES (4, 1, 31, 151, 184, 1);
INSERT INTO Bowler_Scores
  VALUES (4, 1, 32, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (4, 2, 25, 138, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 2, 26, 147, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 2, 27, 172, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (4, 2, 28, 147, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (4, 2, 29, 143, 188, 1);
INSERT INTO Bowler_Scores
  VALUES (4, 2, 30, 167, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (4, 2, 31, 146, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 2, 32, 141, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 3, 25, 155, 200, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 3, 26, 148, 187, 1);
INSERT INTO Bowler_Scores
  VALUES (4, 3, 27, 167, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 3, 28, 140, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 3, 29, 163, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (4, 3, 30, 143, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (4, 3, 31, 182, 215, 1);
INSERT INTO Bowler_Scores
  VALUES (4, 3, 32, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (5, 1, 1, 145, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (5, 1, 2, 148, 185, 1);
INSERT INTO Bowler_Scores
  VALUES (5, 1, 3, 181, 215, 1);
INSERT INTO Bowler_Scores
  VALUES (5, 1, 4, 139, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (5, 1, 9, 147, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (5, 1, 10, 147, 178, 0);
INSERT INTO Bowler_Scores
  VALUES (5, 1, 11, 158, 178, 0);
INSERT INTO Bowler_Scores
  VALUES (5, 1, 12, 147, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (5, 2, 1, 137, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (5, 2, 2, 140, 177, 0);
INSERT INTO Bowler_Scores
  VALUES (5, 2, 3, 158, 192, 1);
INSERT INTO Bowler_Scores
  VALUES (5, 2, 4, 139, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (5, 2, 9, 146, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (5, 2, 10, 167, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (5, 2, 11, 144, 164, 0);
INSERT INTO Bowler_Scores
  VALUES (5, 2, 12, 143, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (5, 3, 1, 152, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (5, 3, 2, 144, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (5, 3, 3, 175, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (5, 3, 4, 138, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (5, 3, 9, 148, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (5, 3, 10, 178, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (5, 3, 11, 158, 178, 0);
INSERT INTO Bowler_Scores
  VALUES (5, 3, 12, 137, 192, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 1, 5, 164, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 1, 6, 179, 223, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 1, 7, 181, 205, 0);
INSERT INTO Bowler_Scores
  VALUES (6, 1, 8, 146, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (6, 1, 13, 164, 206, 0);
INSERT INTO Bowler_Scores
  VALUES (6, 1, 14, 164, 211, 0);
INSERT INTO Bowler_Scores
  VALUES (6, 1, 15, 180, 223, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 1, 16, 149, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 2, 5, 138, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (6, 2, 6, 164, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 2, 7, 183, 207, 0);
INSERT INTO Bowler_Scores
  VALUES (6, 2, 8, 149, 199, 0);
INSERT INTO Bowler_Scores
  VALUES (6, 2, 13, 165, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 2, 14, 156, 203, 0);
INSERT INTO Bowler_Scores
  VALUES (6, 2, 15, 177, 220, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 2, 16, 149, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 3, 5, 165, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 3, 6, 136, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (6, 3, 7, 178, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 3, 8, 138, 188, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 3, 13, 151, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (6, 3, 14, 147, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (6, 3, 15, 158, 201, 0);
INSERT INTO Bowler_Scores
  VALUES (6, 3, 16, 136, 188, 1);
INSERT INTO Bowler_Scores
  VALUES (7, 1, 17, 139, 177, 0);
INSERT INTO Bowler_Scores
  VALUES (7, 1, 18, 142, 172, 0);
INSERT INTO Bowler_Scores
  VALUES (7, 1, 19, 189, 219, 1);
INSERT INTO Bowler_Scores
  VALUES (7, 1, 20, 138, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (7, 1, 25, 143, 188, 1);
INSERT INTO Bowler_Scores
  VALUES (7, 1, 26, 180, 229, 1);
INSERT INTO Bowler_Scores
  VALUES (7, 1, 27, 167, 203, 0);
INSERT INTO Bowler_Scores
  VALUES (7, 1, 28, 148, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (7, 2, 17, 157, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (7, 2, 18, 143, 173, 0);
INSERT INTO Bowler_Scores
  VALUES (7, 2, 19, 176, 206, 0);
INSERT INTO Bowler_Scores
  VALUES (7, 2, 20, 141, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (7, 2, 25, 139, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (7, 2, 26, 175, 224, 1);
INSERT INTO Bowler_Scores
  VALUES (7, 2, 27, 178, 214, 1);
INSERT INTO Bowler_Scores
  VALUES (7, 2, 28, 147, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (7, 3, 17, 155, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (7, 3, 18, 136, 166, 0);
INSERT INTO Bowler_Scores
  VALUES (7, 3, 19, 155, 185, 1);
INSERT INTO Bowler_Scores
  VALUES (7, 3, 20, 139, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (7, 3, 25, 143, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (7, 3, 26, 151, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (7, 3, 27, 137, 173, 0);
INSERT INTO Bowler_Scores
  VALUES (7, 3, 28, 150, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 1, 21, 145, 191, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 1, 22, 146, 173, 0);
INSERT INTO Bowler_Scores
  VALUES (8, 1, 23, 157, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (8, 1, 24, 168, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 1, 29, 140, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (8, 1, 30, 179, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 1, 31, 161, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 1, 32, 138, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (8, 2, 21, 148, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (8, 2, 22, 136, 163, 0);
INSERT INTO Bowler_Scores
  VALUES (8, 2, 23, 193, 218, 0);
INSERT INTO Bowler_Scores
  VALUES (8, 2, 24, 178, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 2, 29, 156, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 2, 30, 149, 183, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 2, 31, 185, 221, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 2, 32, 136, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (8, 3, 21, 136, 182, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 3, 22, 143, 170, 0);
INSERT INTO Bowler_Scores
  VALUES (8, 3, 23, 189, 214, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 3, 24, 168, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 3, 29, 135, 182, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 3, 30, 166, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (8, 3, 31, 140, 176, 0);
INSERT INTO Bowler_Scores
  VALUES (8, 3, 32, 144, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (9, 1, 5, 137, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (9, 1, 6, 178, 218, 1);
INSERT INTO Bowler_Scores
  VALUES (9, 1, 7, 140, 161, 0);
INSERT INTO Bowler_Scores
  VALUES (9, 1, 8, 139, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (9, 1, 9, 164, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (9, 1, 10, 136, 168, 0);
INSERT INTO Bowler_Scores
  VALUES (9, 1, 11, 182, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (9, 1, 12, 145, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (9, 2, 5, 149, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (9, 2, 6, 147, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (9, 2, 7, 145, 166, 0);
INSERT INTO Bowler_Scores
  VALUES (9, 2, 8, 141, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (9, 2, 9, 158, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (9, 2, 10, 167, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (9, 2, 11, 176, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (9, 2, 12, 139, 192, 1);
INSERT INTO Bowler_Scores
  VALUES (9, 3, 5, 162, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (9, 3, 6, 141, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (9, 3, 7, 144, 165, 0);
INSERT INTO Bowler_Scores
  VALUES (9, 3, 8, 149, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (9, 3, 9, 144, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (9, 3, 10, 158, 190, 1);
INSERT INTO Bowler_Scores
  VALUES (9, 3, 11, 158, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (9, 3, 12, 135, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (10, 1, 1, 140, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (10, 1, 2, 141, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (10, 1, 3, 189, 219, 1);
INSERT INTO Bowler_Scores
  VALUES (10, 1, 4, 143, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (10, 1, 13, 150, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (10, 1, 14, 150, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (10, 1, 15, 181, 215, 0);
INSERT INTO Bowler_Scores
  VALUES (10, 1, 16, 145, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (10, 2, 1, 137, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (10, 2, 2, 163, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (10, 2, 3, 135, 165, 0);
INSERT INTO Bowler_Scores
  VALUES (10, 2, 4, 147, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (10, 2, 13, 153, 192, 1);
INSERT INTO Bowler_Scores
  VALUES (10, 2, 14, 154, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (10, 2, 15, 169, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (10, 2, 16, 138, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (10, 3, 1, 161, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (10, 3, 2, 167, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (10, 3, 3, 175, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (10, 3, 4, 140, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (10, 3, 13, 143, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (10, 3, 14, 157, 200, 0);
INSERT INTO Bowler_Scores
  VALUES (10, 3, 15, 153, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (10, 3, 16, 142, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 1, 21, 146, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (11, 1, 22, 174, 214, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 1, 23, 164, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (11, 1, 24, 169, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 1, 25, 158, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 1, 26, 159, 198, 0);
INSERT INTO Bowler_Scores
  VALUES (11, 1, 27, 195, 231, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 1, 28, 138, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (11, 2, 21, 154, 203, 0);
INSERT INTO Bowler_Scores
  VALUES (11, 2, 22, 140, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (11, 2, 23, 140, 162, 0);
INSERT INTO Bowler_Scores
  VALUES (11, 2, 24, 175, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 2, 25, 158, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 2, 26, 171, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 2, 27, 160, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 2, 28, 142, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (11, 3, 21, 159, 208, 0);
INSERT INTO Bowler_Scores
  VALUES (11, 3, 22, 165, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 3, 23, 147, 169, 0);
INSERT INTO Bowler_Scores
  VALUES (11, 3, 24, 167, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 3, 25, 161, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 3, 26, 161, 200, 0);
INSERT INTO Bowler_Scores
  VALUES (11, 3, 27, 158, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (11, 3, 28, 135, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (12, 1, 17, 139, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (12, 1, 18, 145, 186, 1);
INSERT INTO Bowler_Scores
  VALUES (12, 1, 19, 154, 181, 1);
INSERT INTO Bowler_Scores
  VALUES (12, 1, 20, 149, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (12, 1, 29, 137, 186, 1);
INSERT INTO Bowler_Scores
  VALUES (12, 1, 30, 135, 168, 0);
INSERT INTO Bowler_Scores
  VALUES (12, 1, 31, 139, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (12, 1, 32, 140, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (12, 2, 17, 151, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (12, 2, 18, 167, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (12, 2, 19, 183, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (12, 2, 20, 146, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (12, 2, 29, 148, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (12, 2, 30, 171, 204, 0);
INSERT INTO Bowler_Scores
  VALUES (12, 2, 31, 145, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (12, 2, 32, 145, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (12, 3, 17, 155, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (12, 3, 18, 143, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (12, 3, 19, 141, 168, 0);
INSERT INTO Bowler_Scores
  VALUES (12, 3, 20, 149, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (12, 3, 29, 156, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (12, 3, 30, 158, 191, 1);
INSERT INTO Bowler_Scores
  VALUES (12, 3, 31, 184, 219, 1);
INSERT INTO Bowler_Scores
  VALUES (12, 3, 32, 146, 198, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 1, 1, 159, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (13, 1, 2, 163, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (13, 1, 3, 182, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (13, 1, 4, 138, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 1, 17, 150, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 1, 18, 136, 178, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 1, 19, 179, 210, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 1, 20, 146, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (13, 2, 1, 140, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 2, 2, 176, 218, 1);
INSERT INTO Bowler_Scores
  VALUES (13, 2, 3, 178, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (13, 2, 4, 139, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 2, 17, 153, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (13, 2, 18, 174, 216, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 2, 19, 140, 171, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 2, 20, 141, 192, 1);
INSERT INTO Bowler_Scores
  VALUES (13, 3, 1, 158, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (13, 3, 2, 141, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 3, 3, 150, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 3, 4, 140, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 3, 17, 151, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (13, 3, 18, 146, 188, 1);
INSERT INTO Bowler_Scores
  VALUES (13, 3, 19, 173, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (13, 3, 20, 148, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 1, 5, 163, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 1, 6, 136, 177, 0);
INSERT INTO Bowler_Scores
  VALUES (14, 1, 7, 177, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 1, 8, 147, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (14, 1, 21, 146, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (14, 1, 22, 170, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 1, 23, 149, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (14, 1, 24, 176, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 2, 5, 150, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (14, 2, 6, 172, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 2, 7, 135, 166, 0);
INSERT INTO Bowler_Scores
  VALUES (14, 2, 8, 136, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (14, 2, 21, 160, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 2, 22, 140, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (14, 2, 23, 164, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 2, 24, 172, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 3, 5, 142, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (14, 3, 6, 142, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (14, 3, 7, 179, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 3, 8, 148, 198, 0);
INSERT INTO Bowler_Scores
  VALUES (14, 3, 21, 153, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 3, 22, 178, 217, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 3, 23, 180, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (14, 3, 24, 175, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 1, 9, 142, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (15, 1, 10, 155, 190, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 1, 11, 150, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (15, 1, 12, 140, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 1, 25, 163, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 1, 26, 153, 190, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 1, 27, 153, 185, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 1, 28, 143, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 2, 9, 162, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 2, 10, 151, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (15, 2, 11, 146, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (15, 2, 12, 150, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 2, 25, 147, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (15, 2, 26, 156, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 2, 27, 182, 214, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 2, 28, 140, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (15, 3, 9, 163, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 3, 10, 158, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (15, 3, 11, 141, 170, 0);
INSERT INTO Bowler_Scores
  VALUES (15, 3, 12, 140, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 3, 25, 139, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (15, 3, 26, 166, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 3, 27, 193, 225, 1);
INSERT INTO Bowler_Scores
  VALUES (15, 3, 28, 140, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (16, 1, 13, 157, 198, 0);
INSERT INTO Bowler_Scores
  VALUES (16, 1, 14, 162, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (16, 1, 15, 165, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (16, 1, 16, 139, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (16, 1, 29, 164, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (16, 1, 30, 153, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (16, 1, 31, 174, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (16, 1, 32, 140, 191, 1);
INSERT INTO Bowler_Scores
  VALUES (16, 2, 13, 162, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (16, 2, 14, 164, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (16, 2, 15, 135, 167, 0);
INSERT INTO Bowler_Scores
  VALUES (16, 2, 16, 137, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (16, 2, 29, 138, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (16, 2, 30, 167, 203, 0);
INSERT INTO Bowler_Scores
  VALUES (16, 2, 31, 184, 221, 1);
INSERT INTO Bowler_Scores
  VALUES (16, 2, 32, 144, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (16, 3, 13, 139, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (16, 3, 14, 153, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (16, 3, 15, 183, 215, 1);
INSERT INTO Bowler_Scores
  VALUES (16, 3, 16, 147, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (16, 3, 29, 163, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (16, 3, 30, 147, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (16, 3, 31, 149, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (16, 3, 32, 140, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (17, 1, 1, 139, 186, 1);
INSERT INTO Bowler_Scores
  VALUES (17, 1, 2, 175, 216, 1);
INSERT INTO Bowler_Scores
  VALUES (17, 1, 3, 136, 165, 0);
INSERT INTO Bowler_Scores
  VALUES (17, 1, 4, 141, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (17, 1, 21, 141, 186, 1);
INSERT INTO Bowler_Scores
  VALUES (17, 1, 22, 146, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (17, 1, 23, 156, 187, 1);
INSERT INTO Bowler_Scores
  VALUES (17, 1, 24, 162, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (17, 2, 1, 164, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (17, 2, 2, 161, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (17, 2, 3, 174, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (17, 2, 4, 145, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (17, 2, 21, 147, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (17, 2, 22, 141, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (17, 2, 23, 156, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (17, 2, 24, 165, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (17, 3, 1, 161, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (17, 3, 2, 173, 214, 1);
INSERT INTO Bowler_Scores
  VALUES (17, 3, 3, 144, 173, 0);
INSERT INTO Bowler_Scores
  VALUES (17, 3, 4, 141, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (17, 3, 21, 138, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (17, 3, 22, 174, 212, 0);
INSERT INTO Bowler_Scores
  VALUES (17, 3, 23, 190, 221, 1);
INSERT INTO Bowler_Scores
  VALUES (17, 3, 24, 173, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 1, 5, 143, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (18, 1, 6, 145, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (18, 1, 7, 169, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 1, 8, 146, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (18, 1, 17, 149, 192, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 1, 18, 165, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 1, 19, 138, 169, 0);
INSERT INTO Bowler_Scores
  VALUES (18, 1, 20, 148, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 2, 5, 155, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 2, 6, 178, 219, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 2, 7, 175, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 2, 8, 146, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (18, 2, 17, 156, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 2, 18, 173, 215, 0);
INSERT INTO Bowler_Scores
  VALUES (18, 2, 19, 155, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (18, 2, 20, 148, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 3, 5, 136, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (18, 3, 6, 140, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (18, 3, 7, 187, 219, 0);
INSERT INTO Bowler_Scores
  VALUES (18, 3, 8, 142, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (18, 3, 17, 141, 184, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 3, 18, 173, 215, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 3, 19, 190, 221, 1);
INSERT INTO Bowler_Scores
  VALUES (18, 3, 20, 143, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 1, 9, 142, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (19, 1, 10, 169, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 1, 11, 162, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (19, 1, 12, 140, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (19, 1, 29, 144, 191, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 1, 30, 162, 199, 0);
INSERT INTO Bowler_Scores
  VALUES (19, 1, 31, 175, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 1, 32, 143, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 2, 9, 164, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 2, 10, 161, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (19, 2, 11, 137, 171, 0);
INSERT INTO Bowler_Scores
  VALUES (19, 2, 12, 148, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 2, 29, 135, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (19, 2, 30, 177, 214, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 2, 31, 174, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 2, 32, 149, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 3, 9, 162, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 3, 10, 158, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 3, 11, 149, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (19, 3, 12, 142, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 3, 29, 137, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (19, 3, 30, 151, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (19, 3, 31, 186, 220, 1);
INSERT INTO Bowler_Scores
  VALUES (19, 3, 32, 137, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (20, 1, 13, 161, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 1, 14, 175, 216, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 1, 15, 176, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 1, 16, 143, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (20, 1, 25, 144, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (20, 1, 26, 141, 178, 0);
INSERT INTO Bowler_Scores
  VALUES (20, 1, 27, 139, 169, 0);
INSERT INTO Bowler_Scores
  VALUES (20, 1, 28, 150, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 2, 13, 148, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 2, 14, 164, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 2, 15, 144, 177, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 2, 16, 137, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 2, 25, 144, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 2, 26, 158, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (20, 2, 27, 147, 177, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 2, 28, 138, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 3, 13, 162, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 3, 14, 172, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 3, 15, 140, 173, 0);
INSERT INTO Bowler_Scores
  VALUES (20, 3, 16, 138, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (20, 3, 25, 137, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (20, 3, 26, 143, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (20, 3, 27, 172, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (20, 3, 28, 149, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (21, 1, 1, 141, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (21, 1, 2, 141, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (21, 1, 3, 191, 223, 1);
INSERT INTO Bowler_Scores
  VALUES (21, 1, 4, 145, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (21, 1, 25, 142, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (21, 1, 26, 151, 190, 1);
INSERT INTO Bowler_Scores
  VALUES (21, 1, 27, 150, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (21, 1, 28, 148, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (21, 2, 1, 141, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (21, 2, 2, 164, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (21, 2, 3, 189, 221, 1);
INSERT INTO Bowler_Scores
  VALUES (21, 2, 4, 142, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (21, 2, 25, 147, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (21, 2, 26, 138, 177, 0);
INSERT INTO Bowler_Scores
  VALUES (21, 2, 27, 176, 208, 0);
INSERT INTO Bowler_Scores
  VALUES (21, 2, 28, 137, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (21, 3, 1, 139, 185, 1);
INSERT INTO Bowler_Scores
  VALUES (21, 3, 2, 159, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (21, 3, 3, 174, 206, 0);
INSERT INTO Bowler_Scores
  VALUES (21, 3, 4, 137, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (21, 3, 25, 136, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (21, 3, 26, 178, 217, 1);
INSERT INTO Bowler_Scores
  VALUES (21, 3, 27, 191, 223, 1);
INSERT INTO Bowler_Scores
  VALUES (21, 3, 28, 147, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 1, 9, 142, 185, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 1, 10, 165, 201, 0);
INSERT INTO Bowler_Scores
  VALUES (22, 1, 11, 144, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (22, 1, 12, 139, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (22, 1, 17, 139, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (22, 1, 18, 168, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 1, 19, 165, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 1, 20, 144, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 2, 9, 143, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (22, 2, 10, 167, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 2, 11, 188, 224, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 2, 12, 145, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 2, 17, 144, 188, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 2, 18, 159, 199, 0);
INSERT INTO Bowler_Scores
  VALUES (22, 2, 19, 166, 198, 0);
INSERT INTO Bowler_Scores
  VALUES (22, 2, 20, 143, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (22, 3, 9, 153, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (22, 3, 10, 146, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (22, 3, 11, 182, 218, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 3, 12, 147, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 3, 17, 162, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 3, 18, 179, 219, 1);
INSERT INTO Bowler_Scores
  VALUES (22, 3, 19, 179, 211, 0);
INSERT INTO Bowler_Scores
  VALUES (22, 3, 20, 144, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (23, 1, 5, 136, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (23, 1, 6, 175, 216, 1);
INSERT INTO Bowler_Scores
  VALUES (23, 1, 7, 164, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (23, 1, 8, 136, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (23, 1, 29, 159, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (23, 1, 30, 151, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (23, 1, 31, 177, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (23, 1, 32, 142, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (23, 2, 5, 145, 190, 1);
INSERT INTO Bowler_Scores
  VALUES (23, 2, 6, 175, 216, 1);
INSERT INTO Bowler_Scores
  VALUES (23, 2, 7, 182, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (23, 2, 8, 142, 192, 1);
INSERT INTO Bowler_Scores
  VALUES (23, 2, 29, 136, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (23, 2, 30, 149, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (23, 2, 31, 149, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (23, 2, 32, 136, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (23, 3, 5, 154, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (23, 3, 6, 177, 218, 1);
INSERT INTO Bowler_Scores
  VALUES (23, 3, 7, 150, 179, 1);
INSERT INTO Bowler_Scores
  VALUES (23, 3, 8, 142, 192, 1);
INSERT INTO Bowler_Scores
  VALUES (23, 3, 29, 135, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (23, 3, 30, 153, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (23, 3, 31, 141, 173, 0);
INSERT INTO Bowler_Scores
  VALUES (23, 3, 32, 140, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 1, 13, 149, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 1, 14, 138, 176, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 1, 15, 154, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 1, 16, 139, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 1, 21, 159, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (24, 1, 22, 147, 185, 1);
INSERT INTO Bowler_Scores
  VALUES (24, 1, 23, 193, 223, 1);
INSERT INTO Bowler_Scores
  VALUES (24, 1, 24, 171, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (24, 2, 13, 151, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 2, 14, 179, 217, 1);
INSERT INTO Bowler_Scores
  VALUES (24, 2, 15, 157, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 2, 16, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (24, 2, 21, 157, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (24, 2, 22, 172, 210, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 2, 23, 175, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (24, 2, 24, 169, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 3, 13, 149, 190, 1);
INSERT INTO Bowler_Scores
  VALUES (24, 3, 14, 163, 201, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 3, 15, 148, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 3, 16, 139, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 3, 21, 138, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (24, 3, 22, 170, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (24, 3, 23, 168, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (24, 3, 24, 174, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 1, 1, 149, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (25, 1, 2, 157, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (25, 1, 3, 152, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (25, 1, 4, 141, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (25, 1, 29, 164, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 1, 30, 173, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 1, 31, 187, 220, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 1, 32, 145, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 2, 1, 159, 206, 0);
INSERT INTO Bowler_Scores
  VALUES (25, 2, 2, 171, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 2, 3, 179, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 2, 4, 135, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (25, 2, 29, 164, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 2, 30, 156, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (25, 2, 31, 159, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (25, 2, 32, 137, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 3, 1, 138, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (25, 3, 2, 157, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 3, 3, 148, 177, 0);
INSERT INTO Bowler_Scores
  VALUES (25, 3, 4, 137, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (25, 3, 29, 147, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 3, 30, 159, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 3, 31, 147, 180, 1);
INSERT INTO Bowler_Scores
  VALUES (25, 3, 32, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (26, 1, 5, 142, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (26, 1, 6, 166, 204, 0);
INSERT INTO Bowler_Scores
  VALUES (26, 1, 7, 190, 220, 1);
INSERT INTO Bowler_Scores
  VALUES (26, 1, 8, 142, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (26, 1, 25, 164, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (26, 1, 26, 174, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (26, 1, 27, 162, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (26, 1, 28, 145, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (26, 2, 5, 139, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (26, 2, 6, 163, 201, 0);
INSERT INTO Bowler_Scores
  VALUES (26, 2, 7, 173, 203, 0);
INSERT INTO Bowler_Scores
  VALUES (26, 2, 8, 135, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (26, 2, 25, 139, 187, 1);
INSERT INTO Bowler_Scores
  VALUES (26, 2, 26, 170, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (26, 2, 27, 180, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (26, 2, 28, 136, 187, 1);
INSERT INTO Bowler_Scores
  VALUES (26, 3, 5, 160, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (26, 3, 6, 168, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (26, 3, 7, 174, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (26, 3, 8, 137, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (26, 3, 25, 152, 200, 0);
INSERT INTO Bowler_Scores
  VALUES (26, 3, 26, 139, 178, 0);
INSERT INTO Bowler_Scores
  VALUES (26, 3, 27, 141, 173, 0);
INSERT INTO Bowler_Scores
  VALUES (26, 3, 28, 138, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 1, 9, 148, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (27, 1, 10, 174, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 1, 11, 138, 172, 0);
INSERT INTO Bowler_Scores
  VALUES (27, 1, 12, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 1, 21, 155, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 1, 22, 156, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (27, 1, 23, 147, 175, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 1, 24, 166, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (27, 2, 9, 150, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 2, 10, 169, 205, 0);
INSERT INTO Bowler_Scores
  VALUES (27, 2, 11, 141, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (27, 2, 12, 147, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 2, 21, 146, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (27, 2, 22, 174, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 2, 23, 179, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 2, 24, 160, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (27, 3, 9, 152, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 3, 10, 175, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 3, 11, 191, 225, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 3, 12, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (27, 3, 21, 144, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (27, 3, 22, 147, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (27, 3, 23, 147, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (27, 3, 24, 171, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (28, 1, 13, 140, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (28, 1, 14, 155, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (28, 1, 15, 170, 206, 0);
INSERT INTO Bowler_Scores
  VALUES (28, 1, 16, 138, 190, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 1, 17, 165, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 1, 18, 172, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 1, 19, 185, 216, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 1, 20, 140, 190, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 2, 13, 149, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (28, 2, 14, 162, 200, 0);
INSERT INTO Bowler_Scores
  VALUES (28, 2, 15, 140, 176, 0);
INSERT INTO Bowler_Scores
  VALUES (28, 2, 16, 135, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (28, 2, 17, 153, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 2, 18, 180, 218, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 2, 19, 181, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 2, 20, 142, 192, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 3, 13, 142, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (28, 3, 14, 135, 173, 0);
INSERT INTO Bowler_Scores
  VALUES (28, 3, 15, 138, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (28, 3, 16, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 3, 17, 152, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 3, 18, 140, 178, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 3, 19, 167, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (28, 3, 20, 149, 199, 0);
INSERT INTO Bowler_Scores
  VALUES (29, 1, 1, 161, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (29, 1, 2, 143, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (29, 1, 3, 182, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (29, 1, 4, 138, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (29, 1, 9, 158, 202, 0);
INSERT INTO Bowler_Scores
  VALUES (29, 1, 10, 161, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (29, 1, 11, 150, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (29, 1, 12, 145, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (29, 2, 1, 141, 188, 1);
INSERT INTO Bowler_Scores
  VALUES (29, 2, 2, 171, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (29, 2, 3, 145, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (29, 2, 4, 144, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (29, 2, 9, 141, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (29, 2, 10, 160, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (29, 2, 11, 173, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (29, 2, 12, 150, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (29, 3, 1, 156, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (29, 3, 2, 159, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (29, 3, 3, 169, 199, 0);
INSERT INTO Bowler_Scores
  VALUES (29, 3, 4, 146, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (29, 3, 9, 144, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (29, 3, 10, 164, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (29, 3, 11, 166, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (29, 3, 12, 136, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (30, 1, 5, 153, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (30, 1, 6, 152, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (30, 1, 7, 172, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (30, 1, 8, 136, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (30, 1, 13, 136, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (30, 1, 14, 165, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (30, 1, 15, 137, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (30, 1, 16, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (30, 2, 5, 149, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (30, 2, 6, 159, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (30, 2, 7, 153, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (30, 2, 8, 149, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (30, 2, 13, 158, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (30, 2, 14, 148, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (30, 2, 15, 188, 226, 1);
INSERT INTO Bowler_Scores
  VALUES (30, 2, 16, 145, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (30, 3, 5, 147, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (30, 3, 6, 151, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (30, 3, 7, 193, 221, 1);
INSERT INTO Bowler_Scores
  VALUES (30, 3, 8, 143, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (30, 3, 13, 155, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (30, 3, 14, 177, 216, 1);
INSERT INTO Bowler_Scores
  VALUES (30, 3, 15, 145, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (30, 3, 16, 141, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 1, 17, 139, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 1, 18, 144, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 1, 19, 179, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (31, 1, 20, 147, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (31, 1, 25, 157, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (31, 1, 26, 170, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (31, 1, 27, 168, 200, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 1, 28, 143, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 2, 17, 155, 198, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 2, 18, 148, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 2, 19, 167, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 2, 20, 141, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 2, 25, 159, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (31, 2, 26, 165, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (31, 2, 27, 192, 224, 1);
INSERT INTO Bowler_Scores
  VALUES (31, 2, 28, 142, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (31, 3, 17, 136, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 3, 18, 171, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (31, 3, 19, 157, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 3, 20, 137, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 3, 25, 164, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (31, 3, 26, 165, 204, 0);
INSERT INTO Bowler_Scores
  VALUES (31, 3, 27, 183, 215, 1);
INSERT INTO Bowler_Scores
  VALUES (31, 3, 28, 146, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 1, 21, 136, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (32, 1, 22, 143, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (32, 1, 23, 158, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (32, 1, 24, 174, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 1, 29, 151, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 1, 30, 167, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 1, 31, 184, 216, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 1, 32, 143, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (32, 2, 21, 158, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 2, 22, 166, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 2, 23, 188, 218, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 2, 24, 167, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 2, 29, 150, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (32, 2, 30, 166, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 2, 31, 161, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (32, 2, 32, 137, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (32, 3, 21, 159, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 3, 22, 145, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (32, 3, 23, 181, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 3, 24, 168, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 3, 29, 143, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (32, 3, 30, 161, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (32, 3, 31, 152, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (32, 3, 32, 139, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 1, 5, 141, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 1, 6, 143, 181, 1);
INSERT INTO Bowler_Scores
  VALUES (33, 1, 7, 166, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 1, 8, 145, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 1, 9, 152, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (33, 1, 10, 141, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 1, 11, 169, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (33, 1, 12, 147, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (33, 2, 5, 164, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (33, 2, 6, 147, 185, 1);
INSERT INTO Bowler_Scores
  VALUES (33, 2, 7, 160, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 2, 8, 147, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (33, 2, 9, 159, 203, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 2, 10, 140, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 2, 11, 180, 215, 1);
INSERT INTO Bowler_Scores
  VALUES (33, 2, 12, 138, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 3, 5, 140, 186, 1);
INSERT INTO Bowler_Scores
  VALUES (33, 3, 6, 171, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (33, 3, 7, 168, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 3, 8, 140, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 3, 9, 136, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 3, 10, 155, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (33, 3, 11, 194, 229, 1);
INSERT INTO Bowler_Scores
  VALUES (33, 3, 12, 150, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 1, 1, 140, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (34, 1, 2, 160, 198, 0);
INSERT INTO Bowler_Scores
  VALUES (34, 1, 3, 152, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (34, 1, 4, 142, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (34, 1, 13, 146, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 1, 14, 161, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 1, 15, 170, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 1, 16, 144, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 2, 1, 140, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (34, 2, 2, 170, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 2, 3, 158, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 2, 4, 137, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (34, 2, 13, 154, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 2, 14, 170, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 2, 15, 145, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (34, 2, 16, 141, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 3, 1, 149, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (34, 3, 2, 146, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (34, 3, 3, 141, 172, 0);
INSERT INTO Bowler_Scores
  VALUES (34, 3, 4, 149, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 3, 13, 156, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 3, 14, 148, 186, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 3, 15, 176, 214, 1);
INSERT INTO Bowler_Scores
  VALUES (34, 3, 16, 149, 201, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 1, 21, 137, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 1, 22, 157, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 1, 23, 168, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (35, 1, 24, 163, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 1, 25, 141, 187, 1);
INSERT INTO Bowler_Scores
  VALUES (35, 1, 26, 158, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (35, 1, 27, 150, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 1, 28, 147, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (35, 2, 21, 153, 199, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 2, 22, 155, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 2, 23, 142, 171, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 2, 24, 171, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (35, 2, 25, 163, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (35, 2, 26, 157, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (35, 2, 27, 180, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (35, 2, 28, 139, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 3, 21, 159, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (35, 3, 22, 164, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (35, 3, 23, 160, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (35, 3, 24, 162, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 3, 25, 136, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 3, 26, 141, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 3, 27, 151, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (35, 3, 28, 144, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (36, 1, 17, 157, 201, 0);
INSERT INTO Bowler_Scores
  VALUES (36, 1, 18, 157, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (36, 1, 19, 149, 179, 1);
INSERT INTO Bowler_Scores
  VALUES (36, 1, 20, 148, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (36, 1, 29, 162, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (36, 1, 30, 139, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (36, 1, 31, 138, 170, 0);
INSERT INTO Bowler_Scores
  VALUES (36, 1, 32, 142, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (36, 2, 17, 159, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (36, 2, 18, 179, 217, 1);
INSERT INTO Bowler_Scores
  VALUES (36, 2, 19, 192, 222, 1);
INSERT INTO Bowler_Scores
  VALUES (36, 2, 20, 140, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (36, 2, 29, 153, 200, 0);
INSERT INTO Bowler_Scores
  VALUES (36, 2, 30, 158, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (36, 2, 31, 163, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (36, 2, 32, 142, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (36, 3, 17, 148, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (36, 3, 18, 174, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (36, 3, 19, 146, 176, 0);
INSERT INTO Bowler_Scores
  VALUES (36, 3, 20, 139, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (36, 3, 29, 161, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (36, 3, 30, 173, 209, 0);
INSERT INTO Bowler_Scores
  VALUES (36, 3, 31, 156, 188, 1);
INSERT INTO Bowler_Scores
  VALUES (36, 3, 32, 143, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 1, 1, 143, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (37, 1, 2, 139, 177, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 1, 3, 178, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 1, 4, 141, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (37, 1, 17, 164, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 1, 18, 138, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (37, 1, 19, 155, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (37, 1, 20, 149, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 2, 1, 156, 203, 0);
INSERT INTO Bowler_Scores
  VALUES (37, 2, 2, 143, 181, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 2, 3, 159, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (37, 2, 4, 144, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 2, 17, 161, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 2, 18, 142, 178, 0);
INSERT INTO Bowler_Scores
  VALUES (37, 2, 19, 193, 223, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 2, 20, 141, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (37, 3, 1, 151, 198, 0);
INSERT INTO Bowler_Scores
  VALUES (37, 3, 2, 165, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 3, 3, 156, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (37, 3, 4, 148, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 3, 17, 156, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 3, 18, 155, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (37, 3, 19, 192, 222, 1);
INSERT INTO Bowler_Scores
  VALUES (37, 3, 20, 137, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 1, 5, 156, 202, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 1, 6, 155, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (38, 1, 7, 155, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 1, 8, 138, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 1, 21, 157, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (38, 1, 22, 136, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 1, 23, 167, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (38, 1, 24, 173, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (38, 2, 5, 148, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (38, 2, 6, 165, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (38, 2, 7, 167, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (38, 2, 8, 138, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 2, 21, 144, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 2, 22, 161, 199, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 2, 23, 149, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 2, 24, 176, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (38, 3, 5, 153, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (38, 3, 6, 165, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (38, 3, 7, 165, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 3, 8, 145, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 3, 21, 144, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 3, 22, 151, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (38, 3, 23, 183, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (38, 3, 24, 171, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 1, 9, 139, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (39, 1, 10, 146, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (39, 1, 11, 156, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (39, 1, 12, 145, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (39, 1, 25, 154, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 1, 26, 158, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 1, 27, 160, 191, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 1, 28, 148, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 2, 9, 137, 181, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 2, 10, 146, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (39, 2, 11, 145, 178, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 2, 12, 136, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (39, 2, 25, 135, 181, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 2, 26, 158, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 2, 27, 144, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (39, 2, 28, 144, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 3, 9, 150, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 3, 10, 145, 181, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 3, 11, 181, 214, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 3, 12, 147, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (39, 3, 25, 141, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (39, 3, 26, 136, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (39, 3, 27, 175, 206, 0);
INSERT INTO Bowler_Scores
  VALUES (39, 3, 28, 139, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (40, 1, 13, 161, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (40, 1, 14, 161, 199, 0);
INSERT INTO Bowler_Scores
  VALUES (40, 1, 15, 173, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (40, 1, 16, 146, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (40, 1, 29, 141, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (40, 1, 30, 172, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (40, 1, 31, 144, 177, 0);
INSERT INTO Bowler_Scores
  VALUES (40, 1, 32, 142, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (40, 2, 13, 155, 198, 0);
INSERT INTO Bowler_Scores
  VALUES (40, 2, 14, 165, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (40, 2, 15, 143, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (40, 2, 16, 137, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (40, 2, 29, 161, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (40, 2, 30, 140, 177, 0);
INSERT INTO Bowler_Scores
  VALUES (40, 2, 31, 167, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (40, 2, 32, 146, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (40, 3, 13, 140, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (40, 3, 14, 157, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (40, 3, 15, 191, 228, 1);
INSERT INTO Bowler_Scores
  VALUES (40, 3, 16, 139, 191, 1);
INSERT INTO Bowler_Scores
  VALUES (40, 3, 29, 158, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (40, 3, 30, 137, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (40, 3, 31, 192, 225, 0);
INSERT INTO Bowler_Scores
  VALUES (40, 3, 32, 136, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (41, 1, 1, 143, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (41, 1, 2, 156, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (41, 1, 3, 162, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (41, 1, 4, 145, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (41, 1, 21, 151, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (41, 1, 22, 149, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (41, 1, 23, 178, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (41, 1, 24, 164, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (41, 2, 1, 156, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (41, 2, 2, 176, 215, 1);
INSERT INTO Bowler_Scores
  VALUES (41, 2, 3, 188, 220, 1);
INSERT INTO Bowler_Scores
  VALUES (41, 2, 4, 137, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (41, 2, 21, 141, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (41, 2, 22, 170, 209, 0);
INSERT INTO Bowler_Scores
  VALUES (41, 2, 23, 145, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (41, 2, 24, 171, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (41, 3, 1, 142, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (41, 3, 2, 178, 217, 1);
INSERT INTO Bowler_Scores
  VALUES (41, 3, 3, 149, 181, 1);
INSERT INTO Bowler_Scores
  VALUES (41, 3, 4, 149, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (41, 3, 21, 145, 191, 1);
INSERT INTO Bowler_Scores
  VALUES (41, 3, 22, 141, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (41, 3, 23, 143, 173, 0);
INSERT INTO Bowler_Scores
  VALUES (41, 3, 24, 159, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 1, 5, 147, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 1, 6, 163, 201, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 1, 7, 190, 219, 1);
INSERT INTO Bowler_Scores
  VALUES (42, 1, 8, 137, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 1, 17, 158, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (42, 1, 18, 166, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (42, 1, 19, 142, 171, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 1, 20, 138, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (42, 2, 5, 147, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (42, 2, 6, 144, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 2, 7, 171, 200, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 2, 8, 150, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (42, 2, 17, 135, 178, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 2, 18, 169, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (42, 2, 19, 191, 220, 1);
INSERT INTO Bowler_Scores
  VALUES (42, 2, 20, 137, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 3, 5, 145, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 3, 6, 148, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 3, 7, 142, 171, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 3, 8, 140, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (42, 3, 17, 153, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (42, 3, 18, 154, 192, 1);
INSERT INTO Bowler_Scores
  VALUES (42, 3, 19, 177, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (42, 3, 20, 145, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (43, 1, 9, 156, 201, 0);
INSERT INTO Bowler_Scores
  VALUES (43, 1, 10, 180, 217, 1);
INSERT INTO Bowler_Scores
  VALUES (43, 1, 11, 175, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (43, 1, 12, 149, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (43, 1, 29, 157, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (43, 1, 30, 137, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (43, 1, 31, 136, 169, 0);
INSERT INTO Bowler_Scores
  VALUES (43, 1, 32, 140, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (43, 2, 9, 148, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (43, 2, 10, 158, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (43, 2, 11, 151, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (43, 2, 12, 135, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (43, 2, 29, 135, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (43, 2, 30, 163, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (43, 2, 31, 163, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (43, 2, 32, 147, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (43, 3, 9, 159, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (43, 3, 10, 172, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (43, 3, 11, 162, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (43, 3, 12, 140, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (43, 3, 29, 151, 197, 0);
INSERT INTO Bowler_Scores
  VALUES (43, 3, 30, 162, 200, 0);
INSERT INTO Bowler_Scores
  VALUES (43, 3, 31, 148, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (43, 3, 32, 146, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (44, 1, 13, 157, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (44, 1, 14, 171, 209, 0);
INSERT INTO Bowler_Scores
  VALUES (44, 1, 15, 148, 184, 1);
INSERT INTO Bowler_Scores
  VALUES (44, 1, 16, 136, 188, 1);
INSERT INTO Bowler_Scores
  VALUES (44, 1, 25, 143, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (44, 1, 26, 175, 214, 1);
INSERT INTO Bowler_Scores
  VALUES (44, 1, 27, 141, 173, 0);
INSERT INTO Bowler_Scores
  VALUES (44, 1, 28, 136, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (44, 2, 13, 153, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (44, 2, 14, 153, 191, 1);
INSERT INTO Bowler_Scores
  VALUES (44, 2, 15, 153, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (44, 2, 16, 142, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (44, 2, 25, 153, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (44, 2, 26, 142, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (44, 2, 27, 178, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (44, 2, 28, 139, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (44, 3, 13, 157, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (44, 3, 14, 144, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (44, 3, 15, 166, 202, 0);
INSERT INTO Bowler_Scores
  VALUES (44, 3, 16, 140, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (44, 3, 25, 140, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (44, 3, 26, 148, 187, 1);
INSERT INTO Bowler_Scores
  VALUES (44, 3, 27, 192, 224, 1);
INSERT INTO Bowler_Scores
  VALUES (44, 3, 28, 150, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (45, 1, 1, 164, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (45, 1, 2, 143, 181, 1);
INSERT INTO Bowler_Scores
  VALUES (45, 1, 3, 172, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (45, 1, 4, 136, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (45, 1, 25, 159, 206, 0);
INSERT INTO Bowler_Scores
  VALUES (45, 1, 26, 141, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (45, 1, 27, 167, 198, 0);
INSERT INTO Bowler_Scores
  VALUES (45, 1, 28, 150, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (45, 2, 1, 153, 200, 0);
INSERT INTO Bowler_Scores
  VALUES (45, 2, 2, 171, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (45, 2, 3, 164, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (45, 2, 4, 144, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (45, 2, 25, 163, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (45, 2, 26, 162, 201, 0);
INSERT INTO Bowler_Scores
  VALUES (45, 2, 27, 183, 214, 1);
INSERT INTO Bowler_Scores
  VALUES (45, 2, 28, 141, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (45, 3, 1, 163, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (45, 3, 2, 151, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (45, 3, 3, 160, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (45, 3, 4, 139, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (45, 3, 25, 146, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (45, 3, 26, 164, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (45, 3, 27, 182, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (45, 3, 28, 142, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (46, 1, 9, 162, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (46, 1, 10, 176, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (46, 1, 11, 185, 218, 1);
INSERT INTO Bowler_Scores
  VALUES (46, 1, 12, 136, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (46, 1, 17, 146, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (46, 1, 18, 155, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (46, 1, 19, 158, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (46, 1, 20, 147, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (46, 2, 9, 151, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (46, 2, 10, 138, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (46, 2, 11, 162, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (46, 2, 12, 138, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (46, 2, 17, 137, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (46, 2, 18, 145, 182, 1);
INSERT INTO Bowler_Scores
  VALUES (46, 2, 19, 174, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (46, 2, 20, 144, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (46, 3, 9, 146, 191, 1);
INSERT INTO Bowler_Scores
  VALUES (46, 3, 10, 136, 172, 0);
INSERT INTO Bowler_Scores
  VALUES (46, 3, 11, 148, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (46, 3, 12, 137, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (46, 3, 17, 137, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (46, 3, 18, 138, 175, 1);
INSERT INTO Bowler_Scores
  VALUES (46, 3, 19, 178, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (46, 3, 20, 146, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 1, 5, 136, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (47, 1, 6, 174, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 1, 7, 166, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 1, 8, 136, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (47, 1, 29, 161, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 1, 30, 152, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (47, 1, 31, 138, 172, 0);
INSERT INTO Bowler_Scores
  VALUES (47, 1, 32, 137, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 2, 5, 164, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 2, 6, 136, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (47, 2, 7, 170, 199, 0);
INSERT INTO Bowler_Scores
  VALUES (47, 2, 8, 144, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 2, 29, 154, 200, 0);
INSERT INTO Bowler_Scores
  VALUES (47, 2, 30, 147, 185, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 2, 31, 188, 222, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 2, 32, 142, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (47, 3, 5, 151, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 3, 6, 137, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (47, 3, 7, 150, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (47, 3, 8, 142, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 3, 29, 150, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (47, 3, 30, 151, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 3, 31, 186, 220, 1);
INSERT INTO Bowler_Scores
  VALUES (47, 3, 32, 136, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (48, 1, 13, 150, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (48, 1, 14, 167, 205, 0);
INSERT INTO Bowler_Scores
  VALUES (48, 1, 15, 190, 227, 1);
INSERT INTO Bowler_Scores
  VALUES (48, 1, 16, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (48, 1, 21, 154, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (48, 1, 22, 172, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (48, 1, 23, 140, 171, 0);
INSERT INTO Bowler_Scores
  VALUES (48, 1, 24, 175, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (48, 2, 13, 147, 190, 1);
INSERT INTO Bowler_Scores
  VALUES (48, 2, 14, 140, 178, 0);
INSERT INTO Bowler_Scores
  VALUES (48, 2, 15, 178, 215, 1);
INSERT INTO Bowler_Scores
  VALUES (48, 2, 16, 146, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (48, 2, 21, 136, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (48, 2, 22, 161, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (48, 2, 23, 152, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (48, 2, 24, 160, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (48, 3, 13, 149, 192, 1);
INSERT INTO Bowler_Scores
  VALUES (48, 3, 14, 151, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (48, 3, 15, 191, 228, 1);
INSERT INTO Bowler_Scores
  VALUES (48, 3, 16, 141, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (48, 3, 21, 140, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (48, 3, 22, 176, 215, 1);
INSERT INTO Bowler_Scores
  VALUES (48, 3, 23, 148, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (48, 3, 24, 174, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 1, 1, 142, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (49, 1, 2, 142, 180, 0);
INSERT INTO Bowler_Scores
  VALUES (49, 1, 3, 162, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (49, 1, 4, 140, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (49, 1, 29, 156, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 1, 30, 145, 184, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 1, 31, 184, 217, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 1, 32, 142, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 2, 1, 145, 191, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 2, 2, 167, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 2, 3, 152, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (49, 2, 4, 143, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 2, 29, 142, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (49, 2, 30, 144, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (49, 2, 31, 162, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 2, 32, 138, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (49, 3, 1, 140, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (49, 3, 2, 153, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (49, 3, 3, 189, 221, 0);
INSERT INTO Bowler_Scores
  VALUES (49, 3, 4, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 3, 29, 160, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 3, 30, 170, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 3, 31, 190, 223, 1);
INSERT INTO Bowler_Scores
  VALUES (49, 3, 32, 140, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 1, 5, 159, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (50, 1, 6, 174, 213, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 1, 7, 189, 218, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 1, 8, 149, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (50, 1, 25, 158, 204, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 1, 26, 177, 216, 1);
INSERT INTO Bowler_Scores
  VALUES (50, 1, 27, 189, 219, 1);
INSERT INTO Bowler_Scores
  VALUES (50, 1, 28, 141, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 2, 5, 155, 201, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 2, 6, 153, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 2, 7, 195, 224, 1);
INSERT INTO Bowler_Scores
  VALUES (50, 2, 8, 149, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (50, 2, 25, 161, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (50, 2, 26, 175, 214, 1);
INSERT INTO Bowler_Scores
  VALUES (50, 2, 27, 148, 178, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 2, 28, 137, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 3, 5, 139, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 3, 6, 177, 216, 1);
INSERT INTO Bowler_Scores
  VALUES (50, 3, 7, 189, 218, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 3, 8, 135, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 3, 25, 164, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (50, 3, 26, 143, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (50, 3, 27, 189, 219, 1);
INSERT INTO Bowler_Scores
  VALUES (50, 3, 28, 146, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 1, 9, 160, 205, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 1, 10, 150, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (51, 1, 11, 169, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 1, 12, 144, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 1, 21, 144, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (51, 1, 22, 173, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 1, 23, 155, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (51, 1, 24, 166, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (51, 2, 9, 152, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 2, 10, 176, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 2, 11, 175, 208, 0);
INSERT INTO Bowler_Scores
  VALUES (51, 2, 12, 150, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 2, 21, 147, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (51, 2, 22, 135, 173, 0);
INSERT INTO Bowler_Scores
  VALUES (51, 2, 23, 177, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 2, 24, 178, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 3, 9, 149, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 3, 10, 142, 179, 0);
INSERT INTO Bowler_Scores
  VALUES (51, 3, 11, 152, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (51, 3, 12, 140, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (51, 3, 21, 142, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (51, 3, 22, 163, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 3, 23, 179, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (51, 3, 24, 171, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 1, 13, 142, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (52, 1, 14, 171, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 1, 15, 183, 217, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 1, 16, 145, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 1, 17, 149, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 1, 18, 156, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (52, 1, 19, 175, 204, 0);
INSERT INTO Bowler_Scores
  VALUES (52, 1, 20, 142, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (52, 2, 13, 157, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 2, 14, 136, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (52, 2, 15, 148, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (52, 2, 16, 141, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (52, 2, 17, 138, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (52, 2, 18, 155, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 2, 19, 156, 185, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 2, 20, 147, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 3, 13, 160, 203, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 3, 14, 136, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (52, 3, 15, 165, 199, 0);
INSERT INTO Bowler_Scores
  VALUES (52, 3, 16, 148, 200, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 3, 17, 142, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (52, 3, 18, 138, 176, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 3, 19, 184, 213, 1);
INSERT INTO Bowler_Scores
  VALUES (52, 3, 20, 145, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 1, 1, 139, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 1, 2, 145, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 1, 3, 191, 223, 1);
INSERT INTO Bowler_Scores
  VALUES (53, 1, 4, 146, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (53, 1, 5, 150, 196, 1);
INSERT INTO Bowler_Scores
  VALUES (53, 1, 6, 170, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (53, 1, 7, 156, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 1, 8, 141, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 2, 1, 155, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (53, 2, 2, 146, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 2, 3, 155, 187, 1);
INSERT INTO Bowler_Scores
  VALUES (53, 2, 4, 143, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (53, 2, 5, 137, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 2, 6, 179, 217, 1);
INSERT INTO Bowler_Scores
  VALUES (53, 2, 7, 142, 170, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 2, 8, 137, 188, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 3, 1, 158, 205, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 3, 2, 138, 176, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 3, 3, 175, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (53, 3, 4, 140, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 3, 5, 163, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (53, 3, 6, 155, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (53, 3, 7, 137, 165, 0);
INSERT INTO Bowler_Scores
  VALUES (53, 3, 8, 147, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (54, 1, 9, 145, 189, 1);
INSERT INTO Bowler_Scores
  VALUES (54, 1, 10, 175, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (54, 1, 11, 136, 169, 0);
INSERT INTO Bowler_Scores
  VALUES (54, 1, 12, 138, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (54, 1, 13, 141, 184, 0);
INSERT INTO Bowler_Scores
  VALUES (54, 1, 14, 157, 196, 0);
INSERT INTO Bowler_Scores
  VALUES (54, 1, 15, 174, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (54, 1, 16, 149, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (54, 2, 9, 142, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (54, 2, 10, 170, 207, 0);
INSERT INTO Bowler_Scores
  VALUES (54, 2, 11, 171, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (54, 2, 12, 146, 197, 1);
INSERT INTO Bowler_Scores
  VALUES (54, 2, 13, 163, 206, 1);
INSERT INTO Bowler_Scores
  VALUES (54, 2, 14, 170, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (54, 2, 15, 166, 200, 0);
INSERT INTO Bowler_Scores
  VALUES (54, 2, 16, 139, 191, 0);
INSERT INTO Bowler_Scores
  VALUES (54, 3, 9, 158, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (54, 3, 10, 173, 210, 1);
INSERT INTO Bowler_Scores
  VALUES (54, 3, 11, 182, 215, 1);
INSERT INTO Bowler_Scores
  VALUES (54, 3, 12, 139, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (54, 3, 13, 147, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (54, 3, 14, 150, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (54, 3, 15, 147, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (54, 3, 16, 141, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (55, 1, 17, 137, 182, 0);
INSERT INTO Bowler_Scores
  VALUES (55, 1, 18, 153, 192, 0);
INSERT INTO Bowler_Scores
  VALUES (55, 1, 19, 147, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (55, 1, 20, 138, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (55, 1, 21, 155, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (55, 1, 22, 169, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (55, 1, 23, 161, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (55, 1, 24, 170, 199, 1);
INSERT INTO Bowler_Scores
  VALUES (55, 2, 17, 136, 181, 0);
INSERT INTO Bowler_Scores
  VALUES (55, 2, 18, 155, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (55, 2, 19, 150, 178, 0);
INSERT INTO Bowler_Scores
  VALUES (55, 2, 20, 144, 195, 0);
INSERT INTO Bowler_Scores
  VALUES (55, 2, 21, 148, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (55, 2, 22, 170, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (55, 2, 23, 170, 202, 1);
INSERT INTO Bowler_Scores
  VALUES (55, 2, 24, 172, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (55, 3, 17, 149, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (55, 3, 18, 162, 201, 1);
INSERT INTO Bowler_Scores
  VALUES (55, 3, 19, 183, 211, 1);
INSERT INTO Bowler_Scores
  VALUES (55, 3, 20, 138, 189, 0);
INSERT INTO Bowler_Scores
  VALUES (55, 3, 21, 138, 185, 0);
INSERT INTO Bowler_Scores
  VALUES (55, 3, 22, 136, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (55, 3, 23, 155, 187, 0);
INSERT INTO Bowler_Scores
  VALUES (55, 3, 24, 169, 198, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 1, 25, 142, 187, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 1, 26, 177, 216, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 1, 27, 143, 173, 0);
INSERT INTO Bowler_Scores
  VALUES (56, 1, 28, 142, 193, 0);
INSERT INTO Bowler_Scores
  VALUES (56, 1, 29, 138, 183, 0);
INSERT INTO Bowler_Scores
  VALUES (56, 1, 30, 135, 174, 0);
INSERT INTO Bowler_Scores
  VALUES (56, 1, 31, 175, 207, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 1, 32, 143, 195, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 2, 25, 164, 209, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 2, 26, 151, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (56, 2, 27, 143, 173, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 2, 28, 135, 186, 0);
INSERT INTO Bowler_Scores
  VALUES (56, 2, 29, 149, 194, 0);
INSERT INTO Bowler_Scores
  VALUES (56, 2, 30, 155, 194, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 2, 31, 141, 173, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 2, 32, 141, 193, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 3, 25, 163, 208, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 3, 26, 136, 175, 0);
INSERT INTO Bowler_Scores
  VALUES (56, 3, 27, 182, 212, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 3, 28, 139, 190, 0);
INSERT INTO Bowler_Scores
  VALUES (56, 3, 29, 156, 201, 0);
INSERT INTO Bowler_Scores
  VALUES (56, 3, 30, 165, 204, 1);
INSERT INTO Bowler_Scores
  VALUES (56, 3, 31, 138, 170, 0);
INSERT INTO Bowler_Scores
  VALUES (56, 3, 32, 148, 200, 1);

CREATE DATABASE EntertainmentAgencyExample;

use EntertainmentAgencyExample;

CREATE TABLE Agents (
AgentID int NOT NULL ,
AgtFirstName nvarchar (25) NULL ,
AgtLastName nvarchar (25) NULL ,
AgtStreetAddress nvarchar (50) NULL ,
AgtCity nvarchar (30) NULL ,
AgtState nvarchar (2) NULL ,
AgtZipCode nvarchar (10) NULL ,
AgtPhoneNumber nvarchar (15) NULL ,
DateHired datetime NULL ,
Salary decimal(15, 2) NULL ,
CommissionRate float NULL 
);

CREATE TABLE Customers (
CustomerID int NOT NULL ,
CustFirstName nvarchar (25) NULL ,
CustLastName nvarchar (25) NULL ,
CustStreetAddress nvarchar (50) NULL ,
CustCity nvarchar (30) NULL ,
CustState nvarchar (2) NULL ,
CustZipCode nvarchar (10) NULL ,
CustPhoneNumber nvarchar (15) NULL 
);

CREATE TABLE Engagements (
EngagementNumber smallint NOT NULL ,
StartDate datetime NULL ,
EndDate datetime NULL ,
StartTime time NULL ,
StopTime time NULL ,
ContractPrice decimal(15,2) NULL ,
CustomerID int NULL ,
AgentID int NULL ,
EntertainerID int NULL 
);

CREATE TABLE Entertainer_Members (
EntertainerID int NOT NULL ,
MemberID int NOT NULL ,
Status smallint NULL 
);

CREATE TABLE Entertainer_Styles (
EntertainerID int NOT NULL ,
StyleID smallint NOT NULL 
);

CREATE TABLE Entertainers (
EntertainerID int NOT NULL ,
EntStageName nvarchar (50) NULL ,
EntSSN nvarchar (12) NULL ,
EntStreetAddress nvarchar (50) NULL ,
EntCity nvarchar (30) NULL ,
EntState nvarchar (2) NULL ,
EntZipCode nvarchar (10) NULL ,
EntPhoneNumber nvarchar (15) NULL ,
EntWebPage nvarchar (50) NULL ,
EntEMailAddress nvarchar (50) NULL ,
DateEntered datetime NULL 
);

CREATE TABLE Members (
MemberID int NOT NULL ,
MbrFirstName nvarchar (25) NULL ,
MbrLastName nvarchar (25) NULL ,
MbrPhoneNumber nvarchar (15) NULL ,
Gender nvarchar (2) NULL 
);

CREATE TABLE Musical_Preferences (
CustomerID int NOT NULL ,
StyleID smallint NOT NULL 
);

CREATE TABLE Musical_Styles (
StyleID smallint NOT NULL ,
StyleName nvarchar (75) NULL 
);

ALTER TABLE Agents ADD CONSTRAINT Agents_PK PRIMARY KEY (AgentID);

CREATE  UNIQUE  INDEX AgentID ON Agents(AgentID);

CREATE  INDEX AgtZipCode ON Agents(AgtZipCode);

ALTER TABLE Customers ADD CONSTRAINT Customers_PK PRIMARY KEY (CustomerID);

CREATE  UNIQUE  INDEX CustomerID ON Customers(CustomerID);

CREATE  INDEX CustZipCode ON Customers(CustZipCode);

ALTER TABLE Engagements ADD CONSTRAINT Engagements_PK PRIMARY KEY (EngagementNumber);

CREATE  INDEX AgentsEngagements ON Engagements(AgentID);

CREATE  INDEX CustomerID ON Engagements(CustomerID);

CREATE  INDEX CustomersEngagements ON Engagements(CustomerID);

CREATE  INDEX EmployeeID ON Engagements(AgentID);

CREATE  INDEX EntertainerID ON Engagements(EntertainerID);

CREATE  INDEX EntertainersEngagements ON Engagements(EntertainerID);

ALTER TABLE Entertainer_Members ADD CONSTRAINT Entertainer_Members_PK PRIMARY KEY (EntertainerID, MemberID);

CREATE  INDEX EntertainersEntertainerMembers ON Entertainer_Members(EntertainerID);

CREATE  INDEX MembersEntertainerMembers ON Entertainer_Members(MemberID);

ALTER TABLE Entertainer_Styles ADD CONSTRAINT Entertainer_Styles_PK PRIMARY KEY (EntertainerID, StyleID);

CREATE  INDEX EntertainersEntertainerStyles ON Entertainer_Styles(EntertainerID);

CREATE  INDEX MusicalStylesEntStyles ON Entertainer_Styles(StyleID);

ALTER TABLE Entertainers ADD CONSTRAINT Entertainers_PK PRIMARY KEY (EntertainerID);

CREATE  UNIQUE  INDEX EntertainerID ON Entertainers(EntertainerID);

CREATE  INDEX EntZipCode ON Entertainers(EntZipCode);

ALTER TABLE Members ADD CONSTRAINT Members_PK PRIMARY KEY (MemberID);

CREATE  INDEX MemberID ON Members(MemberID);

ALTER TABLE Musical_Preferences ADD CONSTRAINT Musical_Preferences_PK PRIMARY KEY (CustomerID, StyleID);

CREATE  INDEX CustomerID ON Musical_Preferences(CustomerID);

CREATE  INDEX CustomersMusicalPreferences ON Musical_Preferences(CustomerID);

CREATE  INDEX MusicalStylesMusicalPreferences ON Musical_Preferences(StyleID);

CREATE  INDEX StyleID ON Musical_Preferences(StyleID);

ALTER TABLE Musical_Styles ADD CONSTRAINT Musical_Styles_PK PRIMARY KEY (StyleID);

ALTER TABLE Engagements ADD CONSTRAINT Engagements_FK00 FOREIGN KEY (AgentID) REFERENCES Agents (AgentID);

ALTER TABLE Engagements ADD CONSTRAINT Engagements_FK01 FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID);

ALTER TABLE Engagements ADD CONSTRAINT Engagements_FK02 FOREIGN KEY (EntertainerID) REFERENCES Entertainers (EntertainerID);

ALTER TABLE Entertainer_Members ADD CONSTRAINT Entertainer_Members_FK00 FOREIGN KEY (EntertainerID) REFERENCES Entertainers (EntertainerID);

ALTER TABLE Entertainer_Members ADD CONSTRAINT Entertainer_Members_FK01 FOREIGN KEY (MemberID) REFERENCES Members (MemberID);

ALTER TABLE Entertainer_Styles ADD CONSTRAINT Entertainer_Styles_FK00 FOREIGN KEY (EntertainerID) REFERENCES Entertainers (EntertainerID);

ALTER TABLE Entertainer_Styles ADD CONSTRAINT Entertainer_Styles_FK01 FOREIGN KEY (StyleID) REFERENCES Musical_Styles (StyleID);

ALTER TABLE Musical_Preferences ADD CONSTRAINT Musical_Preferences_FK00 FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID);

ALTER TABLE Musical_Preferences ADD CONSTRAINT Musical_Preferences_FK01 FOREIGN KEY (StyleID) REFERENCES Musical_Styles (StyleID);

USE EntertainmentAgencyExample;
INSERT INTO Customers
  VALUES (10001, 'Doris', 'Hartwig', '4726 - 11th Ave. N.E.', 
   'Seattle', 'WA', '98105', '555-2671');
INSERT INTO Customers
  VALUES (10002, 'Deb', 'Waldal', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', '555-2496');
INSERT INTO Customers
  VALUES (10003, 'Peter', 'Brehm', '722 Moss Bay Blvd.', 
   'Kirkland', 'WA', '98033', '555-2501');
INSERT INTO Customers
  VALUES (10004, 'Dean', 'McCrae', '4110 Old Redmond Rd.', 
   'Redmond', 'WA', '98052', '555-2506');
INSERT INTO Customers
  VALUES (10005, 'Elizabeth', 'Hallmark', 'Route 2, Box 203B', 
   'Auburn', 'WA', '98002', '555-2521');
INSERT INTO Customers
  VALUES (10006, 'Matt', 'Berg', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', '555-2581');
INSERT INTO Customers
  VALUES (10007, 'Liz', 'Keyser', '13920 S.E. 40th Street', 
   'Bellevue', 'WA', '98006', '555-2556');
INSERT INTO Customers
  VALUES (10008, 'Darren', 'Gehring', '2601 Seaview Lane', 
   'Kirkland', 'WA', '98033', '555-2616');
INSERT INTO Customers
  VALUES (10009, 'Sarah', 'Thompson', '2222 Springer Road', 
   'Bellevue', 'WA', '98006', '555-2626');
INSERT INTO Customers
  VALUES (10010, 'Zachary', 'Ehrlich', '12330 Kingman Drive', 
   'Kirkland', 'WA', '98033', '555-2721');
INSERT INTO Customers
  VALUES (10011, 'Joyce', 'Bonnicksen', '2424 Thames Drive', 
   'Bellevue', 'WA', '98006', '555-2726');
INSERT INTO Customers
  VALUES (10012, 'Kerry', 'Patterson', '777 Fenexet Blvd', 
   'Redmond', 'WA', '98052', '555-0399');
INSERT INTO Customers
  VALUES (10013, 'Estella', 'Pundt', '2500 Rosales Lane', 
   'Bellevue', 'WA', '98006', '555-9938');
INSERT INTO Customers
  VALUES (10014, 'Mark', 'Rosales', '323 Advocate Lane', 
   'Bellevue', 'WA', '98006', '555-2286');
INSERT INTO Customers
  VALUES (10015, 'Carol', 'Viescas', '754 Fourth Ave', 
   'Seattle', 'WA', '98115', '555-2296');
INSERT INTO Entertainers
  VALUES (1001, 'Carol Peacock Trio', '888-90-1121', 
   '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 
   '555-2691', 'www.cptrio.com', 'carolp@cptrio.com', 
   '1997-05-24');
INSERT INTO Entertainers
  VALUES (1002, 'Topazz', '888-50-1061', '16 Maple Lane', 
   'Auburn', 'WA', '98002', '555-2591', 'www.topazz.com', 
   NULL, '1996-02-14');
INSERT INTO Entertainers
  VALUES (1003, 'JV & the Deep Six', '888-18-1013', 
   '15127 NE 24th, #383', 'Redmond', 'WA', '98052', 
   '555-2511', 'www.jvd6.com', 'jv@myspring.com', '1998-03-18');
INSERT INTO Entertainers
  VALUES (1004, 'Jim Glynn', '888-26-1025', '13920 S.E. 40th Street', 
   'Bellevue', 'WA', '98009', '555-2531', NULL, NULL, 
   '1996-04-01');
INSERT INTO Entertainers
  VALUES (1005, 'Jazz Persuasion', '888-30-1031', '233 West Valley Hwy', 
   'Bellevue', 'WA', '98005', '555-2541', 'www.jazzper.com', 
   NULL, '1997-05-12');
INSERT INTO Entertainers
  VALUES (1006, 'Modern Dance', '888-66-1085', 'Route 2, Box 203B', 
   'Woodinville', 'WA', '98072', '555-2631', 'www.moderndance.com', 
   'mikeh@moderndance.com', '1995-05-16');
INSERT INTO Entertainers
  VALUES (1007, 'Coldwater Cattle Company', '888-38-1043', 
   '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 
   '555-2561', 'www.coldwatercows.com', NULL, '1995-11-30');
INSERT INTO Entertainers
  VALUES (1008, 'Country Feeling', '888-98-1133', 'PO Box 223311', 
   'Seattle', 'WA', '98125', '555-2711', NULL, NULL, 
   '1996-02-28');
INSERT INTO Entertainers
  VALUES (1009, 'Katherine Ehrlich', '888-61-1103', 
   '777 Fenexet Blvd', 'Woodinville', 'WA', '98072', 
   '555-0399', NULL, 'ke@mzo.com', '1998-09-13');
INSERT INTO Entertainers
  VALUES (1010, 'Saturday Revue', '888-64-1109', '3887 Easy Street', 
   'Seattle', 'WA', '98125', '555-0039', 'www.satrevue.com', 
   'edz@coolness.com', '1995-01-20');
INSERT INTO Entertainers
  VALUES (1011, 'Julia Schnebly', '888-65-1111', '2343 Harmony Lane', 
   'Seattle', 'WA', '99837', '555-9936', NULL, NULL, 
   '1996-04-12');
INSERT INTO Entertainers
  VALUES (1012, 'Susan McLain', '888-70-1121', '511 Lenora Ave', 
   'Bellevue', 'WA', '98006', '555-2301', 'www.greensleeves.com', 
   'susan@gs.com', '1998-10-12');
INSERT INTO Entertainers
  VALUES (1013, 'Caroline Coie Cuartet', '888-71-1123', 
   '298 Forest Lane', 'Auburn', 'WA', '98002', '555-2306', 
   NULL, 'carolinec@willow.com', '1997-07-11');
INSERT INTO Agents
  VALUES (1, 'William', 'Thompson', '122 Spring River Drive', 
   'Redmond', 'WA', '98053', '555-2681', '1997-05-15', 
   35000, 0.04);
INSERT INTO Agents
  VALUES (2, 'Scott', 'Bishop', '66 Spring Valley Drive', 
   'Seattle', 'WA', '98125', '555-2666', '1998-02-05', 
   27000, 0.04);
INSERT INTO Agents
  VALUES (3, 'Carol', 'Viescas', '667 Red River Road', 
   'Bellevue', 'WA', '98006', '555-2571', '1997-11-19', 
   30000, 0.05);
INSERT INTO Agents
  VALUES (4, 'Karen', 'Smith', '30301 - 166th Ave. N.E.', 
   'Seattle', 'WA', '98125', '555-2551', '1998-03-05', 
   22000, 0.055);
INSERT INTO Agents
  VALUES (5, 'Marianne', 'Wier', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', '555-2606', '1998-02-02', 
   24500, 0.045);
INSERT INTO Agents
  VALUES (6, 'John', 'Kennedy', '16679 NE 41st Court', 
   'Seattle', 'WA', '98125', '555-2621', '1997-05-15', 
   33000, 0.06);
INSERT INTO Agents
  VALUES (7, 'Caleb', 'Viescas', '4501 Wetland Road', 
   'Redmond', 'WA', '98052', '555-0037', '1998-02-16', 
   22100, 0.035);
INSERT INTO Agents
  VALUES (8, 'Maria', 'Patterson', '3445 Cheyenne Road', 
   'Bellevue', 'WA', '98006', '555-2291', '1997-09-03', 
   30000, 0.04);
INSERT INTO Agents
  VALUES (9, 'Daffy', 'Dumbwit', '1234 Main Street', 
   'Kirkland', 'WA', '98033', '555-1234', '2000-02-05', 
   50, 0.01);
INSERT INTO Engagements
  VALUES (2, '2007-09-01', '2007-09-05', '13:00:00', 
   '15:00:00', 200, 10006, 4, 1004);
INSERT INTO Engagements
  VALUES (3, '2007-09-10', '2007-09-15', '13:00:00', 
   '15:00:00', 590, 10001, 3, 1005);
INSERT INTO Engagements
  VALUES (4, '2007-09-11', '2007-09-17', '20:00:00', 
   '00:00:00', 470, 10007, 3, 1004);
INSERT INTO Engagements
  VALUES (5, '2007-09-11', '2007-09-14', '16:00:00', 
   '19:00:00', 1130, 10006, 5, 1003);
INSERT INTO Engagements
  VALUES (6, '2007-09-10', '2007-09-14', '15:00:00', 
   '21:00:00', 2300, 10014, 7, 1008);
INSERT INTO Engagements
  VALUES (7, '2007-09-11', '2007-09-18', '17:00:00', 
   '20:00:00', 770, 10004, 4, 1002);
INSERT INTO Engagements
  VALUES (8, '2007-09-18', '2007-09-25', '20:00:00', 
   '23:00:00', 1850, 10006, 3, 1007);
INSERT INTO Engagements
  VALUES (9, '2007-09-18', '2007-09-28', '19:00:00', 
   '21:00:00', 1370, 10010, 2, 1010);
INSERT INTO Engagements
  VALUES (10, '2007-09-17', '2007-09-26', '13:00:00', 
   '17:00:00', 3650, 10005, 3, 1003);
INSERT INTO Engagements
  VALUES (11, '2007-09-15', '2007-09-16', '18:00:00', 
   '00:00:00', 950, 10005, 4, 1008);
INSERT INTO Engagements
  VALUES (12, '2007-09-18', '2007-09-26', '18:00:00', 
   '22:00:00', 1670, 10014, 8, 1001);
INSERT INTO Engagements
  VALUES (13, '2007-09-17', '2007-09-20', '20:00:00', 
   '23:00:00', 770, 10003, 1, 1006);
INSERT INTO Engagements
  VALUES (14, '2007-09-24', '2007-09-29', '16:00:00', 
   '22:00:00', 2750, 10001, 1, 1008);
INSERT INTO Engagements
  VALUES (15, '2007-09-24', '2007-09-29', '17:00:00', 
   '19:00:00', 770, 10007, 1, 1013);
INSERT INTO Engagements
  VALUES (16, '2007-10-02', '2007-10-06', '20:00:00', 
   '01:00:00', 1550, 10010, 5, 1013);
INSERT INTO Engagements
  VALUES (17, '2007-09-29', '2007-10-02', '18:00:00', 
   '20:00:00', 530, 10002, 8, 1010);
INSERT INTO Engagements
  VALUES (19, '2007-09-29', '2007-10-05', '20:00:00', 
   '23:00:00', 365, 10009, 8, 1004);
INSERT INTO Engagements
  VALUES (21, '2007-09-30', '2007-10-03', '12:00:00', 
   '16:00:00', 1490, 10005, 1, 1003);
INSERT INTO Engagements
  VALUES (22, '2007-09-30', '2007-10-05', '12:00:00', 
   '15:00:00', 590, 10004, 5, 1002);
INSERT INTO Engagements
  VALUES (23, '2007-09-30', '2007-09-30', '20:00:00', 
   '00:00:00', 290, 10012, 4, 1013);
INSERT INTO Engagements
  VALUES (24, '2007-10-01', '2007-10-07', '12:00:00', 
   '18:00:00', 1940, 10001, 4, 1001);
INSERT INTO Engagements
  VALUES (26, '2007-10-09', '2007-10-14', '17:00:00', 
   '22:00:00', 950, 10001, 6, 1002);
INSERT INTO Engagements
  VALUES (27, '2007-10-07', '2007-10-12', '12:00:00', 
   '16:00:00', 2210, 10015, 7, 1003);
INSERT INTO Engagements
  VALUES (28, '2007-10-06', '2007-10-15', '17:00:00', 
   '22:00:00', 3800, 10003, 4, 1007);
INSERT INTO Engagements
  VALUES (30, '2007-10-06', '2007-10-08', '17:00:00', 
   '22:00:00', 275, 10009, 5, 1011);
INSERT INTO Engagements
  VALUES (31, '2007-10-07', '2007-10-16', '16:00:00', 
   '20:00:00', 2450, 10002, 8, 1010);
INSERT INTO Engagements
  VALUES (32, '2007-10-07', '2007-10-16', '13:00:00', 
   '15:00:00', 1250, 10010, 7, 1013);
INSERT INTO Engagements
  VALUES (34, '2007-10-14', '2007-10-20', '16:00:00', 
   '18:00:00', 680, 10004, 8, 1005);
INSERT INTO Engagements
  VALUES (35, '2007-10-14', '2007-10-15', '19:00:00', 
   '23:00:00', 410, 10005, 8, 1001);
INSERT INTO Engagements
  VALUES (36, '2007-10-13', '2007-10-23', '18:00:00', 
   '22:00:00', 710, 10014, 3, 1011);
INSERT INTO Engagements
  VALUES (37, '2007-10-13', '2007-10-19', '14:00:00', 
   '19:00:00', 2675, 10006, 3, 1008);
INSERT INTO Engagements
  VALUES (38, '2007-10-14', '2007-10-18', '14:00:00', 
   '20:00:00', 1850, 10013, 4, 1006);
INSERT INTO Engagements
  VALUES (41, '2007-10-20', '2007-10-28', '18:00:00', 
   '21:00:00', 860, 10013, 3, 1002);
INSERT INTO Engagements
  VALUES (42, '2007-10-20', '2007-10-26', '17:00:00', 
   '22:00:00', 2150, 10002, 1, 1013);
INSERT INTO Engagements
  VALUES (43, '2007-10-21', '2007-10-21', '14:00:00', 
   '16:00:00', 140, 10001, 8, 1001);
INSERT INTO Engagements
  VALUES (44, '2007-10-22', '2007-10-26', '14:00:00', 
   '19:00:00', 1925, 10006, 3, 1008);
INSERT INTO Engagements
  VALUES (45, '2007-10-21', '2007-10-28', '14:00:00', 
   '18:00:00', 530, 10015, 1, 1012);
INSERT INTO Engagements
  VALUES (46, '2007-10-28', '2007-11-05', '15:00:00', 
   '17:00:00', 1400, 10009, 4, 1008);
INSERT INTO Engagements
  VALUES (48, '2007-11-05', '2007-11-06', '16:00:00', 
   '22:00:00', 950, 10002, 1, 1007);
INSERT INTO Engagements
  VALUES (49, '2007-11-13', '2007-11-19', '12:00:00', 
   '14:00:00', 680, 10014, 5, 1001);
INSERT INTO Engagements
  VALUES (51, '2007-11-13', '2007-11-14', '20:00:00', 
   '01:00:00', 650, 10013, 3, 1013);
INSERT INTO Engagements
  VALUES (52, '2007-11-13', '2007-11-14', '16:00:00', 
   '21:00:00', 650, 10010, 3, 1006);
INSERT INTO Engagements
  VALUES (53, '2007-11-11', '2007-11-12', '17:00:00', 
   '19:00:00', 350, 10002, 5, 1007);
INSERT INTO Engagements
  VALUES (55, '2007-11-19', '2007-11-26', '20:00:00', 
   '02:00:00', 770, 10002, 3, 1011);
INSERT INTO Engagements
  VALUES (56, '2007-11-25', '2007-11-28', '14:00:00', 
   '19:00:00', 1550, 10010, 3, 1007);
INSERT INTO Engagements
  VALUES (58, '2007-12-01', '2007-12-04', '17:00:00', 
   '23:00:00', 770, 10001, 2, 1002);
INSERT INTO Engagements
  VALUES (59, '2007-12-01', '2007-12-04', '15:00:00', 
   '19:00:00', 290, 10004, 6, 1012);
INSERT INTO Engagements
  VALUES (60, '2007-12-02', '2007-12-04', '13:00:00', 
   '17:00:00', 230, 10010, 8, 1004);
INSERT INTO Engagements
  VALUES (61, '2007-12-03', '2007-12-10', '17:00:00', 
   '20:00:00', 410, 10015, 8, 1011);
INSERT INTO Engagements
  VALUES (62, '2007-12-09', '2007-12-10', '20:00:00', 
   '01:00:00', 500, 10003, 2, 1005);
INSERT INTO Engagements
  VALUES (63, '2007-12-18', '2007-12-21', '14:00:00', 
   '16:00:00', 650, 10009, 3, 1008);
INSERT INTO Engagements
  VALUES (64, '2007-12-25', '2008-01-03', '14:00:00', 
   '16:00:00', 1250, 10007, 3, 1013);
INSERT INTO Engagements
  VALUES (66, '2007-12-22', '2007-12-29', '20:00:00', 
   '02:00:00', 2930, 10005, 5, 1006);
INSERT INTO Engagements
  VALUES (68, '2007-12-24', '2007-12-29', '16:00:00', 
   '22:00:00', 1670, 10009, 1, 1005);
INSERT INTO Engagements
  VALUES (69, '2007-12-22', '2007-12-23', '15:00:00', 
   '18:00:00', 500, 10004, 7, 1008);
INSERT INTO Engagements
  VALUES (70, '2007-12-23', '2007-12-26', '13:00:00', 
   '15:00:00', 410, 10010, 6, 1001);
INSERT INTO Engagements
  VALUES (71, '2007-12-22', '2007-12-27', '14:00:00', 
   '17:00:00', 1670, 10002, 1, 1003);
INSERT INTO Engagements
  VALUES (72, '2007-12-22', '2008-01-01', '20:00:00', 
   '01:00:00', 875, 10012, 4, 1011);
INSERT INTO Engagements
  VALUES (73, '2007-12-29', '2008-01-07', '19:00:00', 
   '22:00:00', 1400, 10014, 5, 1001);
INSERT INTO Engagements
  VALUES (74, '2008-01-01', '2008-01-06', '13:00:00', 
   '15:00:00', 590, 10004, 1, 1005);
INSERT INTO Engagements
  VALUES (75, '2008-01-01', '2008-01-11', '17:00:00', 
   '20:00:00', 2525, 10001, 7, 1007);
INSERT INTO Engagements
  VALUES (76, '2007-12-30', '2008-01-03', '16:00:00', 
   '22:00:00', 500, 10005, 7, 1012);
INSERT INTO Engagements
  VALUES (77, '2007-12-30', '2008-01-04', '17:00:00', 
   '20:00:00', 1670, 10015, 5, 1003);
INSERT INTO Engagements
  VALUES (78, '2008-01-01', '2008-01-03', '16:00:00', 
   '20:00:00', 770, 10010, 4, 1010);
INSERT INTO Engagements
  VALUES (79, '2007-12-30', '2008-01-03', '12:00:00', 
   '17:00:00', 1550, 10006, 8, 1006);
INSERT INTO Engagements
  VALUES (80, '2007-12-31', '2008-01-01', '17:00:00', 
   '21:00:00', 650, 10002, 5, 1008);
INSERT INTO Engagements
  VALUES (81, '2008-01-01', '2008-01-09', '13:00:00', 
   '17:00:00', 1130, 10013, 4, 1002);
INSERT INTO Engagements
  VALUES (82, '2008-01-08', '2008-01-09', '20:00:00', 
   '01:00:00', 950, 10014, 8, 1003);
INSERT INTO Engagements
  VALUES (83, '2008-01-06', '2008-01-10', '13:00:00', 
   '15:00:00', 650, 10010, 2, 1006);
INSERT INTO Engagements
  VALUES (84, '2008-01-06', '2008-01-11', '17:00:00', 
   '19:00:00', 230, 10007, 3, 1012);
INSERT INTO Engagements
  VALUES (85, '2008-01-06', '2008-01-08', '14:00:00', 
   '19:00:00', 1175, 10015, 4, 1008);
INSERT INTO Engagements
  VALUES (87, '2008-01-04', '2008-01-06', '16:00:00', 
   '19:00:00', 275, 10007, 6, 1008);
INSERT INTO Engagements
  VALUES (88, '2008-01-07', '2008-01-17', '12:00:00', 
   '14:00:00', 1370, 10004, 8, 1013);
INSERT INTO Engagements
  VALUES (89, '2008-01-06', '2008-01-07', '14:00:00', 
   '16:00:00', 290, 10003, 8, 1010);
INSERT INTO Engagements
  VALUES (90, '2008-01-08', '2008-01-08', '20:00:00', 
   '02:00:00', 320, 10006, 5, 1001);
INSERT INTO Engagements
  VALUES (91, '2008-01-05', '2008-01-12', '13:00:00', 
   '19:00:00', 770, 10009, 3, 1004);
INSERT INTO Engagements
  VALUES (92, '2008-01-12', '2008-01-16', '19:00:00', 
   '00:00:00', 1925, 10012, 6, 1008);
INSERT INTO Engagements
  VALUES (95, '2008-01-15', '2008-01-18', '20:00:00', 
   '01:00:00', 1550, 10010, 6, 1007);
INSERT INTO Engagements
  VALUES (96, '2008-01-22', '2008-01-31', '15:00:00', 
   '17:00:00', 950, 10009, 6, 1005);
INSERT INTO Engagements
  VALUES (97, '2008-01-19', '2008-01-19', '17:00:00', 
   '21:00:00', 110, 10012, 8, 1004);
INSERT INTO Engagements
  VALUES (98, '2008-01-20', '2008-01-27', '20:00:00', 
   '02:00:00', 2930, 10012, 2, 1010);
INSERT INTO Engagements
  VALUES (99, '2008-01-22', '2008-02-22', '14:00:00', 
   '20:00:00', 14105, 10005, 6, 1008);
INSERT INTO Engagements
  VALUES (100, '2008-01-19', '2008-01-23', '12:00:00', 
   '18:00:00', 1850, 10015, 3, 1006);
INSERT INTO Engagements
  VALUES (101, '2008-01-22', '2008-01-30', '14:00:00', 
   '18:00:00', 1670, 10004, 5, 1001);
INSERT INTO Engagements
  VALUES (102, '2008-01-22', '2008-01-31', '12:00:00', 
   '15:00:00', 2300, 10013, 5, 1007);
INSERT INTO Engagements
  VALUES (103, '2008-01-21', '2008-01-27', '12:00:00', 
   '17:00:00', 575, 10010, 4, 1011);
INSERT INTO Engagements
  VALUES (104, '2008-01-28', '2008-02-01', '13:00:00', 
   '16:00:00', 1400, 10010, 6, 1003);
INSERT INTO Engagements
  VALUES (105, '2008-01-27', '2008-02-01', '12:00:00', 
   '17:00:00', 1850, 10002, 4, 1013);
INSERT INTO Engagements
  VALUES (106, '2008-01-29', '2008-02-01', '15:00:00', 
   '18:00:00', 770, 10003, 6, 1006);
INSERT INTO Engagements
  VALUES (107, '2008-01-29', '2008-01-30', '16:00:00', 
   '21:00:00', 200, 10007, 4, 1004);
INSERT INTO Engagements
  VALUES (108, '2008-02-02', '2008-02-04', '18:00:00', 
   '00:00:00', 320, 10004, 5, 1012);
INSERT INTO Engagements
  VALUES (109, '2008-02-11', '2008-02-15', '13:00:00', 
   '19:00:00', 1850, 10014, 5, 1010);
INSERT INTO Engagements
  VALUES (110, '2008-02-11', '2008-02-19', '15:00:00', 
   '19:00:00', 1670, 10006, 8, 1001);
INSERT INTO Engagements
  VALUES (111, '2008-02-12', '2008-02-14', '15:00:00', 
   '18:00:00', 185, 10012, 1, 1004);
INSERT INTO Engagements
  VALUES (112, '2008-02-19', '2008-02-24', '18:00:00', 
   '22:00:00', 410, 10015, 7, 1011);
INSERT INTO Engagements
  VALUES (114, '2008-02-19', '2008-02-28', '12:00:00', 
   '17:00:00', 1550, 10005, 1, 1002);
INSERT INTO Engagements
  VALUES (115, '2008-02-19', '2008-02-22', '12:00:00', 
   '18:00:00', 1490, 10007, 5, 1013);
INSERT INTO Engagements
  VALUES (116, '2008-02-16', '2008-02-25', '14:00:00', 
   '19:00:00', 800, 10003, 6, 1012);
INSERT INTO Engagements
  VALUES (118, '2008-02-18', '2008-02-18', '19:00:00', 
   '00:00:00', 350, 10014, 1, 1010);
INSERT INTO Engagements
  VALUES (119, '2008-02-19', '2008-02-28', '18:00:00', 
   '21:00:00', 500, 10012, 2, 1004);
INSERT INTO Engagements
  VALUES (120, '2008-02-17', '2008-02-20', '20:00:00', 
   '23:00:00', 950, 10002, 7, 1008);
INSERT INTO Engagements
  VALUES (121, '2008-02-16', '2008-02-22', '17:00:00', 
   '23:00:00', 2570, 10004, 3, 1006);
INSERT INTO Engagements
  VALUES (122, '2008-02-24', '2008-02-27', '15:00:00', 
   '19:00:00', 1010, 10014, 5, 1010);
INSERT INTO Engagements
  VALUES (123, '2008-02-25', '2008-02-28', '16:00:00', 
   '20:00:00', 770, 10013, 1, 1001);
INSERT INTO Engagements
  VALUES (124, '2008-02-23', '2008-03-01', '14:00:00', 
   '17:00:00', 1850, 10006, 1, 1008);
INSERT INTO Engagements
  VALUES (125, '2008-02-23', '2008-02-28', '13:00:00', 
   '15:00:00', 1130, 10001, 3, 1003);
INSERT INTO Engagements
  VALUES (126, '2008-02-24', '2008-03-02', '18:00:00', 
   '20:00:00', 1010, 10009, 6, 1006);
INSERT INTO Engagements
  VALUES (127, '2008-02-24', '2008-02-28', '20:00:00', 
   '22:00:00', 500, 10010, 4, 1005);
INSERT INTO Engagements
  VALUES (128, '2008-02-26', '2008-02-28', '19:00:00', 
   '01:00:00', 320, 10003, 4, 1011);
INSERT INTO Engagements
  VALUES (129, '2008-02-24', '2008-03-04', '17:00:00', 
   '21:00:00', 2450, 10004, 5, 1013);
INSERT INTO Engagements
  VALUES (131, '2008-03-02', '2008-03-11', '15:00:00', 
   '17:00:00', 1850, 10014, 1, 1003);
INSERT INTO Members
  VALUES (101, 'David', 'Hamilton', '555-2701', 'M');
INSERT INTO Members
  VALUES (102, 'Suzanne', 'Viescas', '555-2686', 'F');
INSERT INTO Members
  VALUES (103, 'Gary', 'Hallmark', '555-2676', 'M');
INSERT INTO Members
  VALUES (104, 'Jeffrey', 'Smith', '555-2596', 'M');
INSERT INTO Members
  VALUES (105, 'Robert', 'Brown', '555-2491', 'M');
INSERT INTO Members
  VALUES (106, 'Mariya', 'Sergienko', '555-2526', 'F');
INSERT INTO Members
  VALUES (107, 'Sara', 'Sheskey', '555-2566', 'F');
INSERT INTO Members
  VALUES (108, 'Rachel', 'Patterson', '555-2546', 'F');
INSERT INTO Members
  VALUES (109, 'David', 'Viescas', '555-2661', 'M');
INSERT INTO Members
  VALUES (110, 'Manuela', 'Seidel', '555-2641', 'F');
INSERT INTO Members
  VALUES (111, 'Kathryn', 'Patterson', '555-2651', 
   'F');
INSERT INTO Members
  VALUES (112, 'Kendra', 'Bonnicksen', '555-2716', 
   'F');
INSERT INTO Members
  VALUES (113, 'Steve', 'Pundt', '555-9938', 'M');
INSERT INTO Members
  VALUES (114, 'George', 'Chavez', '555-9930', 'M');
INSERT INTO Members
  VALUES (115, 'Joe', 'Rosales III', '555-2281', 'M');
INSERT INTO Members
  VALUES (116, 'Angel', 'Kennedy', '555-2311', 'M');
INSERT INTO Members
  VALUES (117, 'Luke', 'Patterson', '555-2316', 'M');
INSERT INTO Members
  VALUES (118, 'Janice', 'Galvin', '555-2691', 'F');
INSERT INTO Members
  VALUES (119, 'John', 'Viescas', '555-2511', 'M');
INSERT INTO Members
  VALUES (120, 'Michael', 'Hernandez', '555-2711', 
   'M');
INSERT INTO Members
  VALUES (121, 'Katherine', 'Ehrlich', '555-0399', 
   'F');
INSERT INTO Members
  VALUES (122, 'Julia', 'Schnebly', '555-9936', 'F');
INSERT INTO Members
  VALUES (123, 'Susan', 'McLain', '555-2301', 'F');
INSERT INTO Members
  VALUES (124, 'Caroline', 'Coie', '555-2306', 'F');
INSERT INTO Members
  VALUES (125, 'Jim', 'Glynn', '555-2531', NULL);
INSERT INTO Entertainer_Members
  VALUES (1001, 106, 1);
INSERT INTO Entertainer_Members
  VALUES (1001, 107, 1);
INSERT INTO Entertainer_Members
  VALUES (1001, 118, 2);
INSERT INTO Entertainer_Members
  VALUES (1002, 120, 2);
INSERT INTO Entertainer_Members
  VALUES (1002, 121, 1);
INSERT INTO Entertainer_Members
  VALUES (1003, 102, 1);
INSERT INTO Entertainer_Members
  VALUES (1003, 103, 1);
INSERT INTO Entertainer_Members
  VALUES (1003, 104, 1);
INSERT INTO Entertainer_Members
  VALUES (1003, 109, 1);
INSERT INTO Entertainer_Members
  VALUES (1003, 117, 1);
INSERT INTO Entertainer_Members
  VALUES (1003, 119, 2);
INSERT INTO Entertainer_Members
  VALUES (1004, 125, 2);
INSERT INTO Entertainer_Members
  VALUES (1005, 116, 1);
INSERT INTO Entertainer_Members
  VALUES (1005, 120, 2);
INSERT INTO Entertainer_Members
  VALUES (1005, 121, 1);
INSERT INTO Entertainer_Members
  VALUES (1006, 104, 1);
INSERT INTO Entertainer_Members
  VALUES (1006, 113, 1);
INSERT INTO Entertainer_Members
  VALUES (1006, 118, 1);
INSERT INTO Entertainer_Members
  VALUES (1006, 120, 2);
INSERT INTO Entertainer_Members
  VALUES (1007, 101, 1);
INSERT INTO Entertainer_Members
  VALUES (1007, 102, 1);
INSERT INTO Entertainer_Members
  VALUES (1007, 105, 1);
INSERT INTO Entertainer_Members
  VALUES (1007, 107, 2);
INSERT INTO Entertainer_Members
  VALUES (1007, 110, 1);
INSERT INTO Entertainer_Members
  VALUES (1008, 103, 1);
INSERT INTO Entertainer_Members
  VALUES (1008, 105, 1);
INSERT INTO Entertainer_Members
  VALUES (1008, 111, 1);
INSERT INTO Entertainer_Members
  VALUES (1008, 114, 2);
INSERT INTO Entertainer_Members
  VALUES (1008, 115, 1);
INSERT INTO Entertainer_Members
  VALUES (1009, 121, 2);
INSERT INTO Entertainer_Members
  VALUES (1010, 108, 1);
INSERT INTO Entertainer_Members
  VALUES (1010, 112, 2);
INSERT INTO Entertainer_Members
  VALUES (1010, 123, 1);
INSERT INTO Entertainer_Members
  VALUES (1010, 124, 1);
INSERT INTO Entertainer_Members
  VALUES (1011, 122, 2);
INSERT INTO Entertainer_Members
  VALUES (1012, 123, 2);
INSERT INTO Entertainer_Members
  VALUES (1013, 112, 1);
INSERT INTO Entertainer_Members
  VALUES (1013, 114, 1);
INSERT INTO Entertainer_Members
  VALUES (1013, 117, 1);
INSERT INTO Entertainer_Members
  VALUES (1013, 124, 2);
INSERT INTO Musical_Styles
  VALUES (1, '40''s Ballroom Music');
INSERT INTO Musical_Styles
  VALUES (2, '50''s Music');
INSERT INTO Musical_Styles
  VALUES (3, '60''s Music');
INSERT INTO Musical_Styles
  VALUES (4, '70''s Music');
INSERT INTO Musical_Styles
  VALUES (5, '80''s Music');
INSERT INTO Musical_Styles
  VALUES (6, 'Country');
INSERT INTO Musical_Styles
  VALUES (7, 'Classical');
INSERT INTO Musical_Styles
  VALUES (8, 'Classic Rock & Roll');
INSERT INTO Musical_Styles
  VALUES (9, 'Rap');
INSERT INTO Musical_Styles
  VALUES (10, 'Contemporary');
INSERT INTO Musical_Styles
  VALUES (11, 'Country Rock');
INSERT INTO Musical_Styles
  VALUES (12, 'Elvis');
INSERT INTO Musical_Styles
  VALUES (13, 'Folk');
INSERT INTO Musical_Styles
  VALUES (14, 'Chamber Music');
INSERT INTO Musical_Styles
  VALUES (15, 'Jazz');
INSERT INTO Musical_Styles
  VALUES (16, 'Karaoke');
INSERT INTO Musical_Styles
  VALUES (17, 'Motown');
INSERT INTO Musical_Styles
  VALUES (18, 'Modern Rock');
INSERT INTO Musical_Styles
  VALUES (19, 'Rhythm and Blues');
INSERT INTO Musical_Styles
  VALUES (20, 'Show Tunes');
INSERT INTO Musical_Styles
  VALUES (21, 'Standards');
INSERT INTO Musical_Styles
  VALUES (22, 'Top 40 Hits');
INSERT INTO Musical_Styles
  VALUES (23, 'Variety');
INSERT INTO Musical_Styles
  VALUES (24, 'Salsa');
INSERT INTO Musical_Styles
  VALUES (25, '90''s Music');
INSERT INTO Entertainer_Styles
  VALUES (1001, 10);
INSERT INTO Entertainer_Styles
  VALUES (1001, 20);
INSERT INTO Entertainer_Styles
  VALUES (1001, 21);
INSERT INTO Entertainer_Styles
  VALUES (1002, 17);
INSERT INTO Entertainer_Styles
  VALUES (1002, 19);
INSERT INTO Entertainer_Styles
  VALUES (1002, 23);
INSERT INTO Entertainer_Styles
  VALUES (1003, 3);
INSERT INTO Entertainer_Styles
  VALUES (1003, 8);
INSERT INTO Entertainer_Styles
  VALUES (1004, 13);
INSERT INTO Entertainer_Styles
  VALUES (1005, 15);
INSERT INTO Entertainer_Styles
  VALUES (1005, 19);
INSERT INTO Entertainer_Styles
  VALUES (1005, 24);
INSERT INTO Entertainer_Styles
  VALUES (1006, 22);
INSERT INTO Entertainer_Styles
  VALUES (1006, 23);
INSERT INTO Entertainer_Styles
  VALUES (1006, 24);
INSERT INTO Entertainer_Styles
  VALUES (1007, 6);
INSERT INTO Entertainer_Styles
  VALUES (1007, 11);
INSERT INTO Entertainer_Styles
  VALUES (1008, 3);
INSERT INTO Entertainer_Styles
  VALUES (1008, 6);
INSERT INTO Entertainer_Styles
  VALUES (1009, 7);
INSERT INTO Entertainer_Styles
  VALUES (1009, 14);
INSERT INTO Entertainer_Styles
  VALUES (1009, 21);
INSERT INTO Entertainer_Styles
  VALUES (1010, 4);
INSERT INTO Entertainer_Styles
  VALUES (1010, 21);
INSERT INTO Entertainer_Styles
  VALUES (1010, 22);
INSERT INTO Entertainer_Styles
  VALUES (1011, 7);
INSERT INTO Entertainer_Styles
  VALUES (1011, 14);
INSERT INTO Entertainer_Styles
  VALUES (1011, 20);
INSERT INTO Entertainer_Styles
  VALUES (1012, 7);
INSERT INTO Entertainer_Styles
  VALUES (1012, 13);
INSERT INTO Entertainer_Styles
  VALUES (1013, 10);
INSERT INTO Entertainer_Styles
  VALUES (1013, 15);
INSERT INTO Musical_Preferences
  VALUES (10001, 10);
INSERT INTO Musical_Preferences
  VALUES (10001, 22);
INSERT INTO Musical_Preferences
  VALUES (10002, 3);
INSERT INTO Musical_Preferences
  VALUES (10002, 8);
INSERT INTO Musical_Preferences
  VALUES (10003, 17);
INSERT INTO Musical_Preferences
  VALUES (10003, 19);
INSERT INTO Musical_Preferences
  VALUES (10004, 15);
INSERT INTO Musical_Preferences
  VALUES (10004, 21);
INSERT INTO Musical_Preferences
  VALUES (10005, 7);
INSERT INTO Musical_Preferences
  VALUES (10005, 14);
INSERT INTO Musical_Preferences
  VALUES (10006, 13);
INSERT INTO Musical_Preferences
  VALUES (10006, 23);
INSERT INTO Musical_Preferences
  VALUES (10007, 4);
INSERT INTO Musical_Preferences
  VALUES (10007, 8);
INSERT INTO Musical_Preferences
  VALUES (10007, 19);
INSERT INTO Musical_Preferences
  VALUES (10008, 10);
INSERT INTO Musical_Preferences
  VALUES (10008, 21);
INSERT INTO Musical_Preferences
  VALUES (10009, 6);
INSERT INTO Musical_Preferences
  VALUES (10009, 11);
INSERT INTO Musical_Preferences
  VALUES (10009, 18);
INSERT INTO Musical_Preferences
  VALUES (10010, 15);
INSERT INTO Musical_Preferences
  VALUES (10010, 19);
INSERT INTO Musical_Preferences
  VALUES (10010, 24);
INSERT INTO Musical_Preferences
  VALUES (10011, 1);
INSERT INTO Musical_Preferences
  VALUES (10011, 7);
INSERT INTO Musical_Preferences
  VALUES (10011, 21);
INSERT INTO Musical_Preferences
  VALUES (10012, 10);
INSERT INTO Musical_Preferences
  VALUES (10012, 20);
INSERT INTO Musical_Preferences
  VALUES (10013, 15);
INSERT INTO Musical_Preferences
  VALUES (10013, 24);
INSERT INTO Musical_Preferences
  VALUES (10014, 5);
INSERT INTO Musical_Preferences
  VALUES (10014, 18);
INSERT INTO Musical_Preferences
  VALUES (10014, 22);
INSERT INTO Musical_Preferences
  VALUES (10015, 1);
INSERT INTO Musical_Preferences
  VALUES (10015, 20);
INSERT INTO Musical_Preferences
  VALUES (10015, 21);

CREATE DATABASE RecipesExample;

use RecipesExample;

CREATE TABLE Ingredient_Classes (
IngredientClassID smallint NOT NULL ,
IngredientClassDescription nvarchar (255) NULL 
);

CREATE TABLE Ingredients (
IngredientID int NOT NULL ,
IngredientName nvarchar (255) NULL ,
IngredientClassID smallint NULL ,
MeasureAmountID smallint NULL 
);

CREATE TABLE Measurements (
MeasureAmountID smallint NOT NULL ,
MeasurementDescription nvarchar (255) NULL 
);

CREATE TABLE Recipe_Classes (
RecipeClassID smallint NOT NULL ,
RecipeClassDescription nvarchar (255) NULL 
);

CREATE TABLE Recipe_Ingredients (
RecipeID int NOT NULL ,
RecipeSeqNo smallint NOT NULL ,
IngredientID int NULL ,
MeasureAmountID smallint NULL ,
Amount real NULL
);

CREATE TABLE Recipes (
RecipeID int NOT NULL ,
RecipeTitle nvarchar (255) NULL ,
RecipeClassID smallint NULL ,
Preparation text NULL ,
Notes text NULL
);

ALTER TABLE Ingredient_Classes ADD CONSTRAINT Ingredient_Classes_PK PRIMARY KEY (IngredientClassID);

CREATE  INDEX RecipeClassID ON Ingredient_Classes(IngredientClassID);

ALTER TABLE Ingredients ADD CONSTRAINT Ingredients_PK PRIMARY KEY (IngredientID);

CREATE  INDEX Ingredient_ClassesIngredients ON Ingredients(IngredientClassID);

CREATE  INDEX IngredientID ON Ingredients(IngredientID);

CREATE  INDEX MeasurementsIngredients ON Ingredients(MeasureAmountID);

ALTER TABLE Measurements ADD CONSTRAINT Measurements_PK PRIMARY KEY (MeasureAmountID);

CREATE  INDEX RecipeClassID ON Measurements(MeasureAmountID);

ALTER TABLE Recipe_Classes ADD CONSTRAINT Recipe_Classes_PK PRIMARY KEY (RecipeClassID);

CREATE  INDEX RecipeClassID ON Recipe_Classes(RecipeClassID);

ALTER TABLE Recipe_Ingredients ADD CONSTRAINT Recipe_Ingredients_PK PRIMARY KEY (RecipeID, RecipeSeqNo);

CREATE  INDEX IngredientID ON Recipe_Ingredients(IngredientID);

CREATE  INDEX IngredientsRecipe_Ingredients ON Recipe_Ingredients(IngredientID);

CREATE  INDEX MeasureAmountID ON Recipe_Ingredients(MeasureAmountID);

CREATE  INDEX MeasurementsRecipe_Ingredients ON Recipe_Ingredients(MeasureAmountID);

CREATE  INDEX RecipeID ON Recipe_Ingredients(RecipeID);

CREATE  INDEX RecipesRecipe_Ingredients ON Recipe_Ingredients(RecipeID);

ALTER TABLE Recipes ADD CONSTRAINT Recipes_PK PRIMARY KEY (RecipeID);

CREATE  INDEX Recipe_ClassesRecipes ON Recipes(RecipeClassID);

CREATE  INDEX RecipeID ON Recipes(RecipeID);

ALTER TABLE Ingredients ADD CONSTRAINT Ingredients_FK00 FOREIGN KEY (IngredientClassID) REFERENCES Ingredient_Classes (IngredientClassID); 

ALTER TABLE Ingredients ADD CONSTRAINT Ingredients_FK01 FOREIGN KEY (MeasureAmountID) REFERENCES Measurements (MeasureAmountID);

ALTER TABLE Recipes ADD CONSTRAINT Recipes_FK00 FOREIGN KEY (RecipeClassID) REFERENCES Recipe_Classes (RecipeClassID);

USE RecipesExample;
INSERT INTO Ingredient_Classes
  VALUES (1, 'Spice');
INSERT INTO Ingredient_Classes
  VALUES (2, 'Meat');
INSERT INTO Ingredient_Classes
  VALUES (3, 'Vegetable');
INSERT INTO Ingredient_Classes
  VALUES (4, 'Oil');
INSERT INTO Ingredient_Classes
  VALUES (5, 'Pasta');
INSERT INTO Ingredient_Classes
  VALUES (6, 'Grain');
INSERT INTO Ingredient_Classes
  VALUES (7, 'Flour');
INSERT INTO Ingredient_Classes
  VALUES (8, 'Dairy');
INSERT INTO Ingredient_Classes
  VALUES (9, 'Liquid');
INSERT INTO Ingredient_Classes
  VALUES (10, 'Seafood');
INSERT INTO Ingredient_Classes
  VALUES (11, 'Butter');
INSERT INTO Ingredient_Classes
  VALUES (12, 'Cheese');
INSERT INTO Ingredient_Classes
  VALUES (13, 'Sauce');
INSERT INTO Ingredient_Classes
  VALUES (14, 'Dressing');
INSERT INTO Ingredient_Classes
  VALUES (15, 'Gravy');
INSERT INTO Ingredient_Classes
  VALUES (16, 'Topping');
INSERT INTO Ingredient_Classes
  VALUES (17, 'Fruit');
INSERT INTO Ingredient_Classes
  VALUES (18, 'Chips');
INSERT INTO Ingredient_Classes
  VALUES (19, 'Condiment');
INSERT INTO Ingredient_Classes
  VALUES (20, 'Bottle');
INSERT INTO Ingredient_Classes
  VALUES (21, 'Packaged food');
INSERT INTO Ingredient_Classes
  VALUES (22, 'Herb');
INSERT INTO Ingredient_Classes
  VALUES (23, 'Sorbet');
INSERT INTO Ingredient_Classes
  VALUES (24, 'Liquor');
INSERT INTO Measurements
  VALUES (1, 'Ounce');
INSERT INTO Measurements
  VALUES (2, 'Cup');
INSERT INTO Measurements
  VALUES (3, 'Teaspoon');
INSERT INTO Measurements
  VALUES (4, 'Tablespoon');
INSERT INTO Measurements
  VALUES (5, 'Pound');
INSERT INTO Measurements
  VALUES (6, 'Pinch');
INSERT INTO Measurements
  VALUES (7, 'Piece');
INSERT INTO Measurements
  VALUES (8, 'Slice');
INSERT INTO Measurements
  VALUES (9, 'Dash');
INSERT INTO Measurements
  VALUES (10, 'Can');
INSERT INTO Measurements
  VALUES (11, 'Bag');
INSERT INTO Measurements
  VALUES (12, 'Bottle');
INSERT INTO Measurements
  VALUES (13, 'Head');
INSERT INTO Measurements
  VALUES (14, 'Bunch');
INSERT INTO Measurements
  VALUES (15, 'Ear');
INSERT INTO Measurements
  VALUES (16, 'Clove');
INSERT INTO Measurements
  VALUES (17, 'Whole');
INSERT INTO Measurements
  VALUES (18, 'Pint');
INSERT INTO Measurements
  VALUES (19, 'To Taste');
INSERT INTO Measurements
  VALUES (20, 'Package');
INSERT INTO Measurements
  VALUES (21, 'Jar');
INSERT INTO Measurements
  VALUES (22, 'Sprig');
INSERT INTO Measurements
  VALUES (23, 'Quarts');
INSERT INTO Measurements
  VALUES (24, 'sticks');
INSERT INTO Measurements
  VALUES (25, 'filets');
INSERT INTO Measurements
  VALUES (26, 'Scoop');
INSERT INTO Recipe_Classes
  VALUES (1, 'Main course');
INSERT INTO Recipe_Classes
  VALUES (2, 'Vegetable');
INSERT INTO Recipe_Classes
  VALUES (3, 'Starch');
INSERT INTO Recipe_Classes
  VALUES (4, 'Salad');
INSERT INTO Recipe_Classes
  VALUES (5, 'Hors d''oeuvres');
INSERT INTO Recipe_Classes
  VALUES (6, 'Dessert');
INSERT INTO Recipe_Classes
  VALUES (7, 'Soup');
INSERT INTO Recipes
  VALUES (1, 'Irish Stew', 1, 'Cut the beef into 1" chunks. Braise the meat. Add water and Guinness. Chop onions, potatoes, and carrots into 1/2" chunks. Add to stew. Simmer until vegetables are done.', 
   NULL);
INSERT INTO Recipes
  VALUES (2, 'Salsa Buena', 5, 'Coarsely dice the jalapenos.  Mix all ingredients thoroughly in a bowl and let stand in the refrigerator for about an hour.  Serve with your favorite corn chips.', 
   NULL);
INSERT INTO Recipes
  VALUES (3, 'Machos Nachos', 5, 'Slice the jalapenos crosswise (in circles) and set aside.  Grate the cheddar cheese and set aside.  Dice the onion and set aside.  Spread the tortilla chips on a large microwavable dish.  Top the chips with the grated cheese, diced onion, and jalapenos.  Place the dish in the micowave and cook until the cheese just melts, about 3-4 minutes on high.  When the cheese has melted, remove the dish and top with the black olives.', 
   'You can add a half a cup of diced tomatoes to this dish if you like. You can either add them prior to cooking in the microwave or afterwards, just before you add the black olives.');
INSERT INTO Recipes
  VALUES (4, 'Garlic Green Beans', 2, 'Snap off and discard the ends of the beans, then rinse them in cold water.  Mince the two cloves of garlic.  Heat the oil in a frying pan on medium high heat.  When the oil is hot, add the green beans and garlic.  Stir contiuously for about four minutes.  Place the beans on a serving dish when they''re done and sprinkle silvered almonds on the top.', 
   'Be sure not to burn the oil. Watch it carefully while it''s heating.');
INSERT INTO Recipes
  VALUES (5, 'Fettuccini Alfredo', 1, 'Fill a large pot two thirds full with water. Add one tablespoon each of salt and vegetable oil. Bring to a rollling boil.  Reduce heat, add pasta, and stir briefly. Cook until pasta is al dente.  Just before the pasta is ready (about five minutes), melt the butter in a frying pan on low heat.  After the butter has melted, add the heavy cream to the pan. Increase the heat to medium and stir until the mixture is slightly thickened. Remove the pan from the heat once the mixture is ready.  Drain the fettuccini when it''s done and add it to the mixture in the frying pan.  Mix three ounces of the cheese the the fettuccini and toss the entire mixture.  Add another three ounces of cheese and the white pepper, and toss again lightly.', 
   NULL);
INSERT INTO Recipes
  VALUES (6, 'Pollo Picoso', 1, 'Wash chicken pieces thoroughly in cold water. Pat dry and set aside.  Mince garlic and then mix it with the salt, pepper, and cayenne.  Make sure the mixture is combined as thoroughly as possible.  Coat each chicken piece (to taste) with the mixture.  Place pieces in the broiler pan and cook for 15 minutes. Turn pieces and cook for another 15 minutes. Turn pieces once more and cook for 35 - 40 minutes.  When the chicken is cooked, remove from stove and let it stand for 10 minutes.', 
   'Pre-heat the oven to 400 degrees.  Cover the bottom of a broiler pan with a sheet of aluminum foil and then pour in about 1/2 an inch of water. The water will keep the chicken grease drippings from splattering throughout the inside of the stove and causing smoke. The foil makes the pan easier to clean.');
INSERT INTO Recipes
  VALUES (7, 'Mike''s Summer Salad', 4, 'Rinse lettuce and cut into bite size pieces. (You can tear them if you really want to.)  Dust off mushrooms, remove stems, and slice into thick pieces, about 1/4".  Peel the cucumber and slice it into 1/4" thick circles.  Slice the tomatoes into 1/2" wedges.  Wash radishes, remove leafy head and root, and slice into 1/8" circles.  Mix all ingredients together in a large salad bowl and add your favorite balsamic vinaigrette dressing.', 
   NULL);
INSERT INTO Recipes
  VALUES (8, 'Trifle', 6, 'Prepare the Jello and custard per package directions.  In tall dessert cups, place a 1/2" layer of the sponge cake.  Soak the layer of cake in Jello.  Spoon on a thin layer of raspberry jam.  Add a layer of custard.
Continue adding layers of sponge cake, jam, and custard until the cup is full (with a layer of custard on top) -- 2 to 3 layers.  Chill for 2 hours.  Sprinkle colored sugar on top and serve.', 
   'For a "spicier" dessert, replace half the liquid in the Jello with brandy or your favorite liqueur.');
INSERT INTO Recipes
  VALUES (9, 'Roast Beef', 1, 'Place the beef on a roasting rack in a roasting pan.  Make a paste of ground garlic, salt, and pepper.  Smother the outside of the roast with the paste.  Roast at 325 for about 20 minutes per pound or to an internal temperature of 160F for medium-rare.  Remove from oven and let stand 15 minutes before carving.  Reserve the beef drippings for gravy or Yorkshire Pudding.', 
   NULL);
INSERT INTO Recipes
  VALUES (10, 'Yorkshire Pudding', 3, 'Place the eggs and water in a blender.  While running the blender, slowly add the flour.  Add the salt and milk and blend for 30 seconds more.  Let stand in a refrigerator for 1 hour or more.  Heat the roasting pan with beef drippings to 450F.  Pour in the pudding mixture.  Cook in a very hot oven for 20-25 minutes or until puffed up and golden brown.  Remove from the pan immediately and cut into slices.  Serve with brown gravy.', 
   NULL);
INSERT INTO Recipes
  VALUES (11, 'Huachinango Veracruzana (Red Snapper, Veracruz style)', 
   1, 'Heat one ounce of olive oil in a 1.5 quart saucepan.  Slice the onion and sautee lightly in the olive oil.  Drain the canned tomatoes (you can use peeled fresh tomatoes if you like) and puree in a blender.  To the pureed tomatoes, add all the spices, thinly sliced Jalapenos, and green olives.  Pour the tomato and spice mixture into the saucepan with the onions and simmer on a very low heat covered for 30 minutes.  While the sauce is cooking, peel and boil the potatoes.  Just before the potatoes are done, heat the remaining olive oil in a large frypan.  Wash and lightly dust the fish pieces in a mixture of flour, salt, and pepper.  Fry the fish, turning once, until just done.  Place the cooked fish in a large platter.  Surround the fish with the boiled potatoes.  Pour the sauce over the fish, sprinkle with chopped parsley, and serve immediately.
Serves 6.', 
   'You can substitute any firm white fish filets for the Red Snapper.  If you use salted canned tomatoes, reduce the salt in the sauce by half.  Adjust the amount of the Jalapenos in the sauce to suit your taste for spicy food!');
INSERT INTO Recipes
  VALUES (12, 'Asparagus', 2, 'Wash the asparagus and break off the tough part (if any) at the bottom of the stalks.  Arrange on a steaming rack in a large saucepan.  Dab liberally with pats of butter and sprinkle on the chopped garlic.  Steam until just tender -- no more than 5 minutes for large stalks.  Serve immediately.', 
   'You can chill the cooked asparagus and serve with your favorite dip as an appetizer.');
INSERT INTO Recipes
  VALUES (13, 'Tourtire (French-Canadian Pork Pie)', 
   1, 'Brown ground pork and chopped onion, stirring and breaking up pork.  Add spices and salt and pepper.  Simmer, uncovered, for 45 minutes, stirring occasionally.  Preheat oven to 375 degrees.  Prepare pie dough for 2-crust pie.  Line 9" pie plate with half of the rolled-out dough.  Drain pork and stir bread crumbs into pork.  Taste and add more salt and pepper if desired.  Fill pie with pork mixture and top with second half of the rolled-out dough.  Crimp edges of pie and slit the top in several places.  Bake in 375-degree oven for one hour, covering edges of pie crust with foil if necessary.  Serve hot or cold.', 
   'Be sure to use fresh ground pork, not sausage.  Can be made with half ground pork and half ground beef, if desired.');
INSERT INTO Recipes
  VALUES (14, 'Salmon Filets in Parchment Paper', 1, 
   'Julienne carrots, leeks, and bell peppers and steam for several minutes.  Drain and rinse vegetables in ice water and set aside.  Preheat oven to 400 degrees.  Butter 4 large rounds of parchment paper.  Distribute half of vegetables on one side of each round of parchment.  Place a salmon filet on the vegetables on each round.  Top the filets with the rest of the vegetables.  Combine white wine and lemon juice and spoon 1 tablespoon on each filet.  Pour melted butter on filets.  Place a thinly-sliced lemon round on each.  Salt and pepper very lightly.  Fold over parchment paper into half circles and roll and crimp edges tightly.  Bake packets at 400 degrees for 10-15 minutes, depending on thickness of the filets.', 
   'Serve the salmon in the parchment packets. A salad and boiled new potatoes, buttered and sprinkled with fresh parsley, are the perfect complements.');
INSERT INTO Recipes
  VALUES (15, 'Coupe Colonel', 6, 'For each person, place 2 scoops of lemon sorbet in a stemmed glass.  Top with vodka.', 
   'This is a lovely, light, and refreshing dessert.  Use the best sorbet and vodka you can find.  Serve with crisp cookies.');
INSERT INTO Ingredients
  VALUES (1, 'Beef', 2, 1);
INSERT INTO Ingredients
  VALUES (2, 'Onion', 3, 17);
INSERT INTO Ingredients
  VALUES (3, 'Water', 9, 1);
INSERT INTO Ingredients
  VALUES (4, 'Guinness Beer', 9, 1);
INSERT INTO Ingredients
  VALUES (5, 'Potato', 3, 2);
INSERT INTO Ingredients
  VALUES (6, 'Carrot', 3, 2);
INSERT INTO Ingredients
  VALUES (7, 'Tomato', 3, 8);
INSERT INTO Ingredients
  VALUES (8, 'Jalapeno', 3, 2);
INSERT INTO Ingredients
  VALUES (9, 'Garlic', 1, 16);
INSERT INTO Ingredients
  VALUES (10, 'Black Pepper (ground)', 1, 3);
INSERT INTO Ingredients
  VALUES (11, 'Salt', 1, 3);
INSERT INTO Ingredients
  VALUES (12, 'Halibut', 10, 5);
INSERT INTO Ingredients
  VALUES (13, 'Chicken, Fryer', 2, 5);
INSERT INTO Ingredients
  VALUES (14, 'Bacon', 2, 8);
INSERT INTO Ingredients
  VALUES (15, 'Romaine Lettuce', 3, 13);
INSERT INTO Ingredients
  VALUES (16, 'Iceberg Lettuce', 3, 13);
INSERT INTO Ingredients
  VALUES (17, 'Butterhead Lettuce', 3, 13);
INSERT INTO Ingredients
  VALUES (18, 'Scallop', 10, 5);
INSERT INTO Ingredients
  VALUES (19, 'Salmon', 10, 5);
INSERT INTO Ingredients
  VALUES (20, 'Vinegar', 9, 1);
INSERT INTO Ingredients
  VALUES (21, 'Olive Oil', 4, 1);
INSERT INTO Ingredients
  VALUES (22, 'Cucumber', 3, 17);
INSERT INTO Ingredients
  VALUES (23, 'Mushrooms', 3, 2);
INSERT INTO Ingredients
  VALUES (24, 'Red Wine', 9, 2);
INSERT INTO Ingredients
  VALUES (25, 'White Wine', 9, 2);
INSERT INTO Ingredients
  VALUES (26, 'Milk', 8, 2);
INSERT INTO Ingredients
  VALUES (27, 'Cheddar Cheese', 12, 2);
INSERT INTO Ingredients
  VALUES (28, 'Tortilla Chips', 18, 11);
INSERT INTO Ingredients
  VALUES (29, 'Black Olives', 19, 2);
INSERT INTO Ingredients
  VALUES (30, 'Green Beans', 3, 14);
INSERT INTO Ingredients
  VALUES (31, 'Fettuccini Pasta', 5, 1);
INSERT INTO Ingredients
  VALUES (32, 'Heavy Cream', 8, 1);
INSERT INTO Ingredients
  VALUES (33, 'Chicken, Pre-cut', 2, 17);
INSERT INTO Ingredients
  VALUES (34, 'T-bone Steak', 2, 17);
INSERT INTO Ingredients
  VALUES (35, 'Chicken Breast', 2, 7);
INSERT INTO Ingredients
  VALUES (36, 'Chicken Leg', 2, 17);
INSERT INTO Ingredients
  VALUES (37, 'Chicken Wing', 2, 7);
INSERT INTO Ingredients
  VALUES (38, 'Chicken Thigh', 2, 7);
INSERT INTO Ingredients
  VALUES (39, 'New York Steak', 2, 17);
INSERT INTO Ingredients
  VALUES (40, 'Spaghetti', 5, 1);
INSERT INTO Ingredients
  VALUES (41, 'Mustard, Regular', 19, 1);
INSERT INTO Ingredients
  VALUES (42, 'Mustard, Dijon', 19, 1);
INSERT INTO Ingredients
  VALUES (43, 'Ketchup', 19, 1);
INSERT INTO Ingredients
  VALUES (44, 'Salsa', 13, 1);
INSERT INTO Ingredients
  VALUES (45, 'Parmesan Cheese', 12, 1);
INSERT INTO Ingredients
  VALUES (46, 'Blue Cheese', 12, 1);
INSERT INTO Ingredients
  VALUES (47, 'Butter', 11, 4);
INSERT INTO Ingredients
  VALUES (48, 'Green Onion', 3, 14);
INSERT INTO Ingredients
  VALUES (49, 'Green Olives', 19, 2);
INSERT INTO Ingredients
  VALUES (50, 'Vegetable Oil', 4, 4);
INSERT INTO Ingredients
  VALUES (51, 'White Pepper (ground)', 1, 1);
INSERT INTO Ingredients
  VALUES (52, 'Cayenne Pepper, Ground', 1, 1);
INSERT INTO Ingredients
  VALUES (53, 'Radishes', 3, 14);
INSERT INTO Ingredients
  VALUES (54, 'Balsamic Vinaigrette Dressing', 20, 
   1);
INSERT INTO Ingredients
  VALUES (55, 'Sponge Cake', 21, 20);
INSERT INTO Ingredients
  VALUES (56, 'Raspberry Jello', 21, 20);
INSERT INTO Ingredients
  VALUES (57, 'Bird''s Custard Powder', 21, 20);
INSERT INTO Ingredients
  VALUES (58, 'Colored sugar sprinkles', 1, 3);
INSERT INTO Ingredients
  VALUES (59, 'Raspberry Jam', 21, 21);
INSERT INTO Ingredients
  VALUES (61, 'Flour', 6, 2);
INSERT INTO Ingredients
  VALUES (62, 'Eggs', 8, 7);
INSERT INTO Ingredients
  VALUES (63, 'Beef drippings', 4, 3);
INSERT INTO Ingredients
  VALUES (64, 'Red Snapper', 10, 1);
INSERT INTO Ingredients
  VALUES (65, 'Canned tomatoes', 3, 10);
INSERT INTO Ingredients
  VALUES (66, 'Nutmeg', 1, 3);
INSERT INTO Ingredients
  VALUES (67, 'Cinnamon', 1, 3);
INSERT INTO Ingredients
  VALUES (68, 'Lime Juice', 9, 3);
INSERT INTO Ingredients
  VALUES (69, 'Asparagus', 3, 5);
INSERT INTO Ingredients
  VALUES (70, 'Parsley', 22, 22);
INSERT INTO Ingredients
  VALUES (71, 'Pie dough for 2-crust pie', 21, 24);
INSERT INTO Ingredients
  VALUES (72, 'Ground Pork', 2, 5);
INSERT INTO Ingredients
  VALUES (73, 'Ground Clove', 1, 3);
INSERT INTO Ingredients
  VALUES (74, 'Bread Crumbs', 21, 2);
INSERT INTO Ingredients
  VALUES (75, 'Leek', 3, 7);
INSERT INTO Ingredients
  VALUES (76, 'Red Bell Pepper', 3, 7);
INSERT INTO Ingredients
  VALUES (77, 'Lemon Juice', 9, 4);
INSERT INTO Ingredients
  VALUES (78, 'Lemon ', 17, 7);
INSERT INTO Ingredients
  VALUES (79, 'Lemon Sorbet', 23, 26);
INSERT INTO Ingredients
  VALUES (80, 'Vodka', 24, 4);
INSERT INTO Recipe_Ingredients
  VALUES (1, 1, 1, 5, 1);
INSERT INTO Recipe_Ingredients
  VALUES (1, 2, 2, 17, 2);
INSERT INTO Recipe_Ingredients
  VALUES (1, 3, 5, 17, 4);
INSERT INTO Recipe_Ingredients
  VALUES (1, 4, 6, 17, 6);
INSERT INTO Recipe_Ingredients
  VALUES (1, 5, 3, 23, 4);
INSERT INTO Recipe_Ingredients
  VALUES (1, 6, 4, 1, 12);
INSERT INTO Recipe_Ingredients
  VALUES (2, 1, 8, 17, 6);
INSERT INTO Recipe_Ingredients
  VALUES (2, 2, 7, 17, 2);
INSERT INTO Recipe_Ingredients
  VALUES (2, 3, 2, 17, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (2, 4, 10, 4, 1);
INSERT INTO Recipe_Ingredients
  VALUES (2, 5, 11, 3, 1);
INSERT INTO Recipe_Ingredients
  VALUES (3, 1, 8, 17, 4);
INSERT INTO Recipe_Ingredients
  VALUES (3, 2, 27, 2, 1);
INSERT INTO Recipe_Ingredients
  VALUES (3, 3, 2, 17, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (3, 4, 28, 11, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (3, 5, 29, 2, 0.25);
INSERT INTO Recipe_Ingredients
  VALUES (4, 1, 30, 5, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (4, 2, 9, 16, 2);
INSERT INTO Recipe_Ingredients
  VALUES (4, 3, 21, 4, 1);
INSERT INTO Recipe_Ingredients
  VALUES (5, 1, 31, 1, 16);
INSERT INTO Recipe_Ingredients
  VALUES (5, 2, 50, 4, 1);
INSERT INTO Recipe_Ingredients
  VALUES (5, 3, 11, 3, 3);
INSERT INTO Recipe_Ingredients
  VALUES (5, 4, 47, 4, 6);
INSERT INTO Recipe_Ingredients
  VALUES (5, 5, 32, 2, 0.25);
INSERT INTO Recipe_Ingredients
  VALUES (5, 12, 45, 1, 6);
INSERT INTO Recipe_Ingredients
  VALUES (5, 16, 51, 19, 0);
INSERT INTO Recipe_Ingredients
  VALUES (6, 1, 36, 7, 2);
INSERT INTO Recipe_Ingredients
  VALUES (6, 2, 38, 7, 2);
INSERT INTO Recipe_Ingredients
  VALUES (6, 3, 11, 3, 1.5);
INSERT INTO Recipe_Ingredients
  VALUES (6, 4, 10, 3, 1.5);
INSERT INTO Recipe_Ingredients
  VALUES (6, 5, 9, 16, 3);
INSERT INTO Recipe_Ingredients
  VALUES (6, 6, 52, 19, 0);
INSERT INTO Recipe_Ingredients
  VALUES (7, 1, 15, 13, 1);
INSERT INTO Recipe_Ingredients
  VALUES (7, 2, 23, 7, 12);
INSERT INTO Recipe_Ingredients
  VALUES (7, 3, 22, 17, 1);
INSERT INTO Recipe_Ingredients
  VALUES (7, 4, 7, 17, 1);
INSERT INTO Recipe_Ingredients
  VALUES (7, 5, 53, 14, 1);
INSERT INTO Recipe_Ingredients
  VALUES (7, 6, 54, 4, 3);
INSERT INTO Recipe_Ingredients
  VALUES (8, 1, 55, 20, 1);
INSERT INTO Recipe_Ingredients
  VALUES (8, 2, 56, 20, 1);
INSERT INTO Recipe_Ingredients
  VALUES (8, 3, 57, 20, 1);
INSERT INTO Recipe_Ingredients
  VALUES (8, 4, 59, 21, 1);
INSERT INTO Recipe_Ingredients
  VALUES (8, 5, 58, 3, 1);
INSERT INTO Recipe_Ingredients
  VALUES (9, 1, 1, 5, 4);
INSERT INTO Recipe_Ingredients
  VALUES (9, 2, 9, 16, 6);
INSERT INTO Recipe_Ingredients
  VALUES (9, 3, 11, 3, 1);
INSERT INTO Recipe_Ingredients
  VALUES (9, 4, 10, 3, 1);
INSERT INTO Recipe_Ingredients
  VALUES (10, 1, 61, 2, 1.5);
INSERT INTO Recipe_Ingredients
  VALUES (10, 2, 3, 2, 1);
INSERT INTO Recipe_Ingredients
  VALUES (10, 3, 62, 7, 2);
INSERT INTO Recipe_Ingredients
  VALUES (10, 4, 11, 3, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (10, 5, 26, 2, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (10, 6, 63, 3, 4);
INSERT INTO Recipe_Ingredients
  VALUES (11, 1, 64, 5, 2);
INSERT INTO Recipe_Ingredients
  VALUES (11, 2, 21, 1, 4);
INSERT INTO Recipe_Ingredients
  VALUES (11, 3, 2, 17, 1);
INSERT INTO Recipe_Ingredients
  VALUES (11, 4, 65, 10, 2);
INSERT INTO Recipe_Ingredients
  VALUES (11, 5, 11, 3, 1);
INSERT INTO Recipe_Ingredients
  VALUES (11, 6, 10, 3, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (11, 7, 66, 3, 0.25);
INSERT INTO Recipe_Ingredients
  VALUES (11, 8, 67, 3, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (11, 9, 68, 3, 2);
INSERT INTO Recipe_Ingredients
  VALUES (11, 10, 49, 7, 8);
INSERT INTO Recipe_Ingredients
  VALUES (11, 11, 61, 2, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (11, 12, 70, 22, 2);
INSERT INTO Recipe_Ingredients
  VALUES (12, 1, 69, 5, 1);
INSERT INTO Recipe_Ingredients
  VALUES (12, 2, 47, 4, 4);
INSERT INTO Recipe_Ingredients
  VALUES (12, 3, 9, 16, 4);
INSERT INTO Recipe_Ingredients
  VALUES (13, 1, 71, 24, 2);
INSERT INTO Recipe_Ingredients
  VALUES (13, 2, 72, 5, 2);
INSERT INTO Recipe_Ingredients
  VALUES (13, 3, 2, 2, 0.333);
INSERT INTO Recipe_Ingredients
  VALUES (13, 4, 67, 4, 1);
INSERT INTO Recipe_Ingredients
  VALUES (13, 5, 73, 3, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (13, 6, 11, 3, 0.25);
INSERT INTO Recipe_Ingredients
  VALUES (13, 7, 10, 3, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (13, 8, 74, 2, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (14, 1, 19, 25, 4);
INSERT INTO Recipe_Ingredients
  VALUES (14, 2, 6, 7, 2);
INSERT INTO Recipe_Ingredients
  VALUES (14, 3, 75, 7, 1);
INSERT INTO Recipe_Ingredients
  VALUES (14, 4, 76, 7, 1);
INSERT INTO Recipe_Ingredients
  VALUES (14, 5, 47, 4, 4);
INSERT INTO Recipe_Ingredients
  VALUES (14, 6, 25, 4, 2);
INSERT INTO Recipe_Ingredients
  VALUES (14, 7, 77, 4, 2);
INSERT INTO Recipe_Ingredients
  VALUES (14, 8, 78, 7, 1);
INSERT INTO Recipe_Ingredients
  VALUES (14, 9, 11, 3, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (14, 10, 10, 3, 0.5);
INSERT INTO Recipe_Ingredients
  VALUES (15, 1, 79, 26, 2);
INSERT INTO Recipe_Ingredients
  VALUES (15, 2, 80, 4, 2);

CREATE DATABASE SalesOrdersExample;

use SalesOrdersExample;

CREATE TABLE Categories (
CategoryID smallint NOT NULL ,
CategoryDescription nvarchar (75) NULL 
);

CREATE TABLE Customers (
CustomerID int NOT NULL ,
CustFirstName nvarchar (25) NULL ,
CustLastName nvarchar (25) NULL ,
CustStreetAddress nvarchar (50) NULL ,
CustCity nvarchar (30) NULL ,
CustState nvarchar (2) NULL ,
CustZipCode nvarchar (10) NULL ,
CustAreaCode smallint NULL ,
CustPhoneNumber nvarchar (8) NULL 
);

CREATE TABLE Employees (
EmployeeID int NOT NULL ,
EmpFirstName nvarchar (25) NULL ,
EmpLastName nvarchar (25) NULL ,
EmpStreetAddress nvarchar (50) NULL ,
EmpCity nvarchar (30) NULL ,
EmpState nvarchar (2) NULL ,
EmpZipCode nvarchar (10) NULL ,
EmpAreaCode smallint NULL ,
EmpPhoneNumber nvarchar (8) NULL 
);

CREATE TABLE Order_Details (
OrderNumber smallint NOT NULL ,
ProductNumber smallint NOT NULL ,
QuotedPrice decimal (15,2) NULL ,
QuantityOrdered smallint NULL 
);

CREATE TABLE Orders (
OrderNumber smallint NOT NULL ,
OrderDate datetime NULL ,
ShipDate datetime NULL ,
CustomerID int NULL ,
EmployeeID int NULL 
);

CREATE TABLE Product_Vendors (
ProductNumber smallint NOT NULL ,
VendorID smallint NOT NULL ,
WholesalePrice decimal (15,2) NULL ,
DaysToDeliver smallint NULL 
);

CREATE TABLE Products (
ProductNumber smallint NOT NULL ,
ProductName nvarchar (50) NULL ,
ProductDescription nvarchar (100) NULL ,
RetailPrice decimal (15,2) NULL ,
QuantityOnHand smallint NULL ,
CategoryID smallint NULL 
);

CREATE TABLE Vendors (
VendorID smallint NOT NULL ,
VendName nvarchar (25) NULL ,
VendStreetAddress nvarchar (50) NULL ,
VendCity nvarchar (30) NULL ,
VendState nvarchar (2) NULL ,
VendZipCode nvarchar (10) NULL ,
VendPhoneNumber nvarchar (15) NULL ,
VendFaxNumber nvarchar (15) NULL ,
VendWebPage text NULL ,
VendEMailAddress nvarchar (50) NULL
);

ALTER TABLE Categories ADD CONSTRAINT Categories_PK PRIMARY KEY (CategoryID);

CREATE  INDEX CategoryID ON Categories(CategoryID);

ALTER TABLE Customers ADD CONSTRAINT Customers_PK PRIMARY KEY (CustomerID);

CREATE  INDEX CustAreaCode ON Customers(CustAreaCode);

CREATE  UNIQUE  INDEX CustomerID ON Customers(CustomerID);

CREATE  INDEX CustZipCode ON Customers(CustZipCode);

ALTER TABLE Employees ADD CONSTRAINT Employees_PK PRIMARY KEY (EmployeeID);

CREATE  INDEX EmpAreaCode ON Employees(EmpAreaCode);

CREATE  UNIQUE  INDEX EmployeeID ON Employees(EmployeeID);

CREATE  INDEX EmpZipCode ON Employees(EmpZipCode);

ALTER TABLE Order_Details ADD CONSTRAINT Order_Details_PK PRIMARY KEY (OrderNumber, ProductNumber);

CREATE  INDEX OrdersOrderDetails ON Order_Details(OrderNumber);

CREATE  INDEX ProductsOrderDetails ON Order_Details(ProductNumber);

ALTER TABLE Orders ADD CONSTRAINT Orders_PK PRIMARY KEY (OrderNumber);

CREATE  INDEX CustomerID ON Orders(CustomerID);

CREATE  INDEX CustomersOrders ON Orders(CustomerID);

CREATE  INDEX EmployeeID ON Orders(EmployeeID);

CREATE  INDEX EmployeesOrders ON Orders(EmployeeID);

ALTER TABLE Product_Vendors ADD CONSTRAINT Product_Vendors_PK PRIMARY KEY (ProductNumber, VendorID);

CREATE  INDEX ProductsProductVendors ON Product_Vendors(ProductNumber);

CREATE  INDEX VendorID ON Product_Vendors(VendorID);

CREATE  INDEX VendorsProductVendors ON Product_Vendors(VendorID);

ALTER TABLE Products ADD CONSTRAINT Products_PK PRIMARY KEY (ProductNumber);

CREATE  INDEX CategoriesProducts ON Products(CategoryID);

ALTER TABLE Vendors ADD CONSTRAINT Vendors_PK PRIMARY KEY (VendorID);

CREATE  UNIQUE  INDEX VendorID ON Vendors(VendorID);

CREATE  INDEX VendZipCode ON Vendors(VendZipCode);

ALTER TABLE Order_Details ADD CONSTRAINT Order_Details_FK00 FOREIGN KEY (OrderNumber) REFERENCES Orders (OrderNumber);

ALTER TABLE Order_Details ADD CONSTRAINT Order_Details_FK01 FOREIGN KEY (ProductNumber) REFERENCES Products (ProductNumber);

ALTER TABLE Orders ADD CONSTRAINT Orders_FK00 FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID);

ALTER TABLE Orders ADD CONSTRAINT Orders_FK01 FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID);

ALTER TABLE Product_Vendors ADD CONSTRAINT Product_Vendors_FK00 FOREIGN KEY (ProductNumber) REFERENCES Products (ProductNumber);

ALTER TABLE Product_Vendors ADD CONSTRAINT Product_Vendors_FK01 FOREIGN KEY (VendorID) REFERENCES Vendors (VendorID);

ALTER TABLE Products ADD CONSTRAINT Products_FK00 FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID);

USE SalesOrdersExample;
INSERT INTO Customers
  VALUES (1001, 'Suzanne', 'Viescas', '15127 NE 24th, #383', 
   'Redmond', 'WA', '98052', 425, '555-2686');
INSERT INTO Customers
  VALUES (1002, 'William', 'Thompson', '122 Spring River Drive', 
   'Duvall', 'WA', '98019', 425, '555-2681');
INSERT INTO Customers
  VALUES (1003, 'Gary', 'Hallmark', 'Route 2, Box 203B', 
   'Auburn', 'WA', '98002', 253, '555-2676');
INSERT INTO Customers
  VALUES (1004, 'Robert', 'Brown', '672 Lamont Ave', 
   'Houston', 'TX', '77201', 713, '555-2491');
INSERT INTO Customers
  VALUES (1005, 'Dean', 'McCrae', '4110 Old Redmond Rd.', 
   'Redmond', 'WA', '98052', 425, '555-2506');
INSERT INTO Customers
  VALUES (1006, 'John', 'Viescas', '15127 NE 24th, #383', 
   'Redmond', 'WA', '98052', 425, '555-2511');
INSERT INTO Customers
  VALUES (1007, 'Mariya', 'Sergienko', '901 Pine Avenue', 
   'Portland', 'OR', '97208', 503, '555-2526');
INSERT INTO Customers
  VALUES (1008, 'Neil', 'Patterson', '233 West Valley Hwy', 
   'San Diego', 'CA', '92199', 619, '555-2541');
INSERT INTO Customers
  VALUES (1009, 'Andrew', 'Cencini', '507 - 20th Ave. E.
Apt. 2A', 
   'Seattle', 'WA', '98105', 206, '555-2601');
INSERT INTO Customers
  VALUES (1010, 'Angel', 'Kennedy', '667 Red River Road', 
   'Austin', 'TX', '78710', 512, '555-2571');
INSERT INTO Customers
  VALUES (1011, 'Alaina', 'Hallmark', 'Route 2, Box 203B', 
   'Woodinville', 'WA', '98072', 425, '555-2631');
INSERT INTO Customers
  VALUES (1012, 'Liz', 'Keyser', '13920 S.E. 40th Street', 
   'Bellevue', 'WA', '98006', 425, '555-2556');
INSERT INTO Customers
  VALUES (1013, 'Rachel', 'Patterson', '2114 Longview Lane', 
   'San Diego', 'CA', '92199', 619, '555-2546');
INSERT INTO Customers
  VALUES (1014, 'Sam', 'Abolrous', '611 Alpine Drive', 
   'Palm Springs', 'CA', '92263', 760, '555-2611');
INSERT INTO Customers
  VALUES (1015, 'Darren', 'Gehring', '2601 Seaview Lane', 
   'Chico', 'CA', '95926', 530, '555-2616');
INSERT INTO Customers
  VALUES (1016, 'Jim', 'Wilson', '101 NE 88th', 'Salem', 
   'OR', '97301', 503, '555-2636');
INSERT INTO Customers
  VALUES (1017, 'Manuela', 'Seidel', '66 Spring Valley Drive', 
   'Medford', 'OR', '97501', 541, '555-2641');
INSERT INTO Customers
  VALUES (1018, 'David', 'Smith', '311 20th Ave. N.E.', 
   'Fremont', 'CA', '94538', 510, '555-2646');
INSERT INTO Customers
  VALUES (1019, 'Zachary', 'Ehrlich', '12330 Kingman Drive', 
   'Glendale', 'CA', '91209', 818, '555-2721');
INSERT INTO Customers
  VALUES (1020, 'Joyce', 'Bonnicksen', '2424 Thames Drive', 
   'Bellevue', 'WA', '98006', 425, '555-2726');
INSERT INTO Customers
  VALUES (1021, 'Estella', 'Pundt', '2500 Rosales Lane', 
   'Dallas', 'TX', '75260', 972, '555-9938');
INSERT INTO Customers
  VALUES (1022, 'Caleb', 'Viescas', '4501 Wetland Road', 
   'Long Beach', 'CA', '90809', 562, '555-0037');
INSERT INTO Customers
  VALUES (1023, 'Julia', 'Schnebly', '2343 Harmony Lane', 
   'Seattle', 'WA', '99837', 206, '555-9936');
INSERT INTO Customers
  VALUES (1024, 'Mark', 'Rosales', '323 Advocate Lane', 
   'El Paso', 'TX', '79915', 915, '555-2286');
INSERT INTO Customers
  VALUES (1025, 'Maria', 'Patterson', '3445 Cheyenne Road', 
   'El Paso', 'TX', '79915', 915, '555-2291');
INSERT INTO Customers
  VALUES (1026, 'Kirk', 'DeGrasse', '455 West Palm Ave', 
   'San Antonio', 'TX', '78284', 210, '555-2311');
INSERT INTO Customers
  VALUES (1027, 'Luke', 'Patterson', '877 145th Ave SE', 
   'Portland', 'OR', '97208', 503, '555-2316');
INSERT INTO Employees
  VALUES (701, 'Ann', 'Patterson', '16 Maple Lane', 
   'Auburn', 'WA', '98002', 253, '555-2591');
INSERT INTO Employees
  VALUES (702, 'Mary', 'Thompson', '122 Spring River Drive', 
   'Duvall', 'WA', '98019', 425, '555-2516');
INSERT INTO Employees
  VALUES (703, 'Matt', 'Berg', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', 253, '555-2581');
INSERT INTO Employees
  VALUES (704, 'Carol', 'Viescas', '722 Moss Bay Blvd.', 
   'Kirkland', 'WA', '98033', 425, '555-2576');
INSERT INTO Employees
  VALUES (705, 'Kirk', 'DeGrasse', '455 West Palm Ave', 
   'San Antonio', 'TX', '78284', 210, '5552311');
INSERT INTO Employees
  VALUES (706, 'David', 'Viescas', '16679 NE 42nd Court', 
   'Redmond', 'WA', '98052', 425, '555-2661');
INSERT INTO Employees
  VALUES (707, 'Kathryn', 'Patterson', '554 E. Wilshire
Apt. 2A', 
   'Seattle', 'WA', '98105', 206, '555-2697');
INSERT INTO Employees
  VALUES (708, 'Susan', 'McLain', '511 Lenora Ave', 
   'Bellevue', 'WA', '98006', 425, '555-2301');
INSERT INTO Vendors
  VALUES (1, 'Shinoman, Incorporated', '3042 19th Avenue South', 
   'Bellevue', 'WA', '98001', '(425) 888-1234', '(425) 888-1235', 
   '#http://www.shinoman.com/#', 'Sales@Shiniman.com');
INSERT INTO Vendors
  VALUES (2, 'Viscount', '1911 Commerce Way', 'St. Louis', 
   'MO', '63127', '(314) 777-1234', '(314) 777-1235', 
   '#http://www.viscountbikes.com/#', 'Orders@ViscountBikes.com');
INSERT INTO Vendors
  VALUES (3, 'Nikoma of America', '88 Old North Road Ave', 
   'Ballard', 'WA', '91324', '(206) 666-1234', '(314) 666-1235', 
   '#http://www.nikomabikes.com/#', 'BuyBikes@NikomaBikes.com');
INSERT INTO Vendors
  VALUES (4, 'ProFormance', '29 N. Quail St.', 'Albany', 
   'NY', '12012', '(518) 444-1234', '(518) 444-1235', 
   '#http://www.ProFormBikes.com/#', 'Sales@ProFormBikes.com');
INSERT INTO Vendors
  VALUES (5, 'Kona, Incorporated', 'PO Box 10429', 
   'Redmond', 'WA', '98052', '(425) 333-1234', '(425) 333-1235', 
   '#http://www.konabikes.com/#', 'Sales@KonaBikes.com');
INSERT INTO Vendors
  VALUES (6, 'Big Sky Mountain Bikes', 'Glacier Bay South', 
   'Anchorage', 'AK', '99209', '(907) 222-1234', '(907) 222-1235', 
   NULL, NULL);
INSERT INTO Vendors
  VALUES (7, 'Dog Ear', '575 Madison Ave.', 'New York', 
   'NY', '10003', '(212) 888-9876', '(212) 888-9877', 
   NULL, NULL);
INSERT INTO Vendors
  VALUES (8, 'Sun Sports Suppliers', 'PO Box 8082', 
   'Santa Monica', 'CA', '91003', '(310) 777-9876', 
   '(310) 777-9877', NULL, NULL);
INSERT INTO Vendors
  VALUES (9, 'Lone Star Bike Supply', '7402 Kingman Drive', 
   'El Paso', 'TX', '79915', '(915) 666-9876', '(915) 666-9877', 
   NULL, NULL);
INSERT INTO Vendors
  VALUES (10, 'Armadillo Brand', '12330 Side Road Lane', 
   'Dallas', 'TX', '75137', '(214) 444-9876', '(214) 444-9877', 
   '#http://www.DilloBikes.com/#', 'BikeProducts@DilloBikes.com');
INSERT INTO Categories
  VALUES (1, 'Accessories');
INSERT INTO Categories
  VALUES (2, 'Bikes');
INSERT INTO Categories
  VALUES (3, 'Clothing');
INSERT INTO Categories
  VALUES (4, 'Components');
INSERT INTO Categories
  VALUES (5, 'Car racks');
INSERT INTO Categories
  VALUES (6, 'Wheels');
INSERT INTO Products
  VALUES (1, 'Trek 9000 Mountain Bike', NULL, 1200, 
   6, 2);
INSERT INTO Products
  VALUES (2, 'Eagle FS-3 Mountain Bike', NULL, 1800, 
   8, 2);
INSERT INTO Products
  VALUES (3, 'Dog Ear Cyclecomputer', NULL, 75, 20, 
   1);
INSERT INTO Products
  VALUES (4, 'Victoria Pro All Weather Tires', NULL, 
   54.95, 20, 4);
INSERT INTO Products
  VALUES (5, 'Dog Ear Helmet Mount Mirrors', NULL, 
   7.45, 12, 1);
INSERT INTO Products
  VALUES (6, 'Viscount Mountain Bike', NULL, 635, 5, 
   2);
INSERT INTO Products
  VALUES (7, 'Viscount C-500 Wireless Bike Computer', 
   NULL, 49, 30, 1);
INSERT INTO Products
  VALUES (8, 'Kryptonite Advanced 2000 U-Lock', NULL, 
   50, 20, 1);
INSERT INTO Products
  VALUES (9, 'Nikoma Lok-Tight U-Lock', NULL, 33, 12, 
   1);
INSERT INTO Products
  VALUES (10, 'Viscount Microshell Helmet', NULL, 36, 
   20, 1);
INSERT INTO Products
  VALUES (11, 'GT RTS-2 Mountain Bike', NULL, 1650, 
   5, 2);
INSERT INTO Products
  VALUES (12, 'Shinoman 105 SC Brakes', NULL, 23.5, 
   16, 4);
INSERT INTO Products
  VALUES (13, 'Shinoman Dura-Ace Headset', NULL, 67.5, 
   20, 4);
INSERT INTO Products
  VALUES (14, 'Eagle SA-120 Clipless Pedals', NULL, 
   139.95, 20, 4);
INSERT INTO Products
  VALUES (15, 'ProFormance Toe-Klips 2G', NULL, 4.99, 
   40, 4);
INSERT INTO Products
  VALUES (16, 'ProFormance ATB All-Terrain Pedal', 
   NULL, 28, 40, 4);
INSERT INTO Products
  VALUES (17, 'Shinoman Deluxe TX-30 Pedal', NULL, 
   45, 60, 4);
INSERT INTO Products
  VALUES (18, 'Viscount CardioSport Sport Watch', NULL, 
   179, 12, 1);
INSERT INTO Products
  VALUES (19, 'Viscount Tru-Beat Heart Transmitter', 
   NULL, 47, 20, 1);
INSERT INTO Products
  VALUES (20, 'Dog Ear Monster Grip Gloves', NULL, 
   15, 30, 1);
INSERT INTO Products
  VALUES (21, 'Dog Ear Aero-Flow Floor Pump', NULL, 
   55, 25, 1);
INSERT INTO Products
  VALUES (22, 'Pro-Sport ''Dillo Shades', NULL, 82, 
   18, 1);
INSERT INTO Products
  VALUES (23, 'Ultra-Pro Rain Jacket', NULL, 85, 30, 
   3);
INSERT INTO Products
  VALUES (24, 'StaDry Cycling Pants', NULL, 69, 22, 
   3);
INSERT INTO Products
  VALUES (25, 'King Cobra Helmet', NULL, 139, 30, 1);
INSERT INTO Products
  VALUES (26, 'Glide-O-Matic Cycling Helmet', NULL, 
   125, 24, 1);
INSERT INTO Products
  VALUES (27, 'X-Pro All Weather Tires', NULL, 24, 
   20, 6);
INSERT INTO Products
  VALUES (28, 'Turbo Twin Tires', NULL, 29, 18, 6);
INSERT INTO Products
  VALUES (29, 'Ultra-2K Competition Tire', NULL, 34, 
   22, 6);
INSERT INTO Products
  VALUES (30, 'Clear Shade 85-T Glasses', NULL, 45, 
   14, 1);
INSERT INTO Products
  VALUES (31, 'True Grip Competition Gloves', NULL, 
   22, 20, 1);
INSERT INTO Products
  VALUES (32, 'Kool-Breeze Rocket Top Jersey', NULL, 
   32, 12, 3);
INSERT INTO Products
  VALUES (33, 'Wonder Wool Cycle Socks', NULL, 19, 
   30, 3);
INSERT INTO Products
  VALUES (34, 'TransPort Bicycle Rack', NULL, 27, 14, 
   1);
INSERT INTO Products
  VALUES (35, 'HP Deluxe Panniers', NULL, 39, 10, 1);
INSERT INTO Products
  VALUES (36, 'Cosmic Elite Road Warrior Wheels', NULL, 
   165, 22, 4);
INSERT INTO Products
  VALUES (37, 'AeroFlo ATB Wheels', NULL, 189, 40, 
   4);
INSERT INTO Products
  VALUES (38, 'Cycle-Doc Pro Repair Stand', NULL, 166, 
   12, 1);
INSERT INTO Products
  VALUES (39, 'Road Warrior Hitch Pack', NULL, 175, 
   6, 5);
INSERT INTO Products
  VALUES (40, 'Ultimate Export 2G Car Rack', NULL, 
   180, 8, 5);
INSERT INTO Orders
  VALUES (1, '2007-09-01', '2007-09-04', 1018, 707);
INSERT INTO Orders
  VALUES (2, '2007-09-01', '2007-09-03', 1001, 703);
INSERT INTO Orders
  VALUES (3, '2007-09-01', '2007-09-04', 1002, 707);
INSERT INTO Orders
  VALUES (4, '2007-09-01', '2007-09-03', 1009, 703);
INSERT INTO Orders
  VALUES (5, '2007-09-01', '2007-09-01', 1024, 708);
INSERT INTO Orders
  VALUES (6, '2007-09-01', '2007-09-05', 1014, 702);
INSERT INTO Orders
  VALUES (7, '2007-09-01', '2007-09-04', 1001, 708);
INSERT INTO Orders
  VALUES (8, '2007-09-01', '2007-09-01', 1003, 703);
INSERT INTO Orders
  VALUES (9, '2007-09-01', '2007-09-04', 1007, 708);
INSERT INTO Orders
  VALUES (10, '2007-09-01', '2007-09-04', 1012, 701);
INSERT INTO Orders
  VALUES (11, '2007-09-02', '2007-09-04', 1020, 706);
INSERT INTO Orders
  VALUES (12, '2007-09-02', '2007-09-05', 1024, 706);
INSERT INTO Orders
  VALUES (13, '2007-09-02', '2007-09-02', 1024, 704);
INSERT INTO Orders
  VALUES (14, '2007-09-02', '2007-09-03', 1013, 704);
INSERT INTO Orders
  VALUES (15, '2007-09-02', '2007-09-06', 1004, 701);
INSERT INTO Orders
  VALUES (16, '2007-09-02', '2007-09-06', 1001, 707);
INSERT INTO Orders
  VALUES (17, '2007-09-02', '2007-09-03', 1014, 702);
INSERT INTO Orders
  VALUES (18, '2007-09-02', '2007-09-03', 1016, 708);
INSERT INTO Orders
  VALUES (19, '2007-09-02', '2007-09-06', 1027, 707);
INSERT INTO Orders
  VALUES (20, '2007-09-02', '2007-09-02', 1011, 706);
INSERT INTO Orders
  VALUES (21, '2007-09-03', '2007-09-03', 1014, 702);
INSERT INTO Orders
  VALUES (22, '2007-09-03', '2007-09-07', 1026, 702);
INSERT INTO Orders
  VALUES (23, '2007-09-03', '2007-09-04', 1017, 705);
INSERT INTO Orders
  VALUES (24, '2007-09-03', '2007-09-05', 1010, 705);
INSERT INTO Orders
  VALUES (25, '2007-09-03', '2007-09-04', 1017, 708);
INSERT INTO Orders
  VALUES (26, '2007-09-04', '2007-09-08', 1013, 707);
INSERT INTO Orders
  VALUES (27, '2007-09-04', '2007-09-05', 1014, 703);
INSERT INTO Orders
  VALUES (28, '2007-09-04', '2007-09-08', 1004, 703);
INSERT INTO Orders
  VALUES (29, '2007-09-04', '2007-09-08', 1015, 707);
INSERT INTO Orders
  VALUES (30, '2007-09-04', '2007-09-08', 1010, 708);
INSERT INTO Orders
  VALUES (31, '2007-09-05', '2007-09-09', 1014, 701);
INSERT INTO Orders
  VALUES (32, '2007-09-05', '2007-09-09', 1012, 704);
INSERT INTO Orders
  VALUES (33, '2007-09-05', '2007-09-06', 1024, 704);
INSERT INTO Orders
  VALUES (34, '2007-09-06', '2007-09-07', 1010, 705);
INSERT INTO Orders
  VALUES (35, '2007-09-06', '2007-09-06', 1012, 701);
INSERT INTO Orders
  VALUES (36, '2007-09-06', '2007-09-07', 1007, 705);
INSERT INTO Orders
  VALUES (37, '2007-09-07', '2007-09-11', 1027, 702);
INSERT INTO Orders
  VALUES (38, '2007-09-07', '2007-09-11', 1017, 702);
INSERT INTO Orders
  VALUES (39, '2007-09-07', '2007-09-10', 1004, 704);
INSERT INTO Orders
  VALUES (40, '2007-09-07', '2007-09-07', 1017, 703);
INSERT INTO Orders
  VALUES (41, '2007-09-07', '2007-09-07', 1008, 706);
INSERT INTO Orders
  VALUES (42, '2007-09-07', '2007-09-10', 1012, 704);
INSERT INTO Orders
  VALUES (43, '2007-09-07', '2007-09-11', 1020, 705);
INSERT INTO Orders
  VALUES (44, '2007-09-07', '2007-09-08', 1005, 701);
INSERT INTO Orders
  VALUES (45, '2007-09-08', '2007-09-08', 1008, 708);
INSERT INTO Orders
  VALUES (46, '2007-09-08', '2007-09-09', 1018, 707);
INSERT INTO Orders
  VALUES (47, '2007-09-08', '2007-09-10', 1023, 708);
INSERT INTO Orders
  VALUES (48, '2007-09-08', '2007-09-11', 1004, 707);
INSERT INTO Orders
  VALUES (49, '2007-09-08', '2007-09-08', 1015, 704);
INSERT INTO Orders
  VALUES (50, '2007-09-08', '2007-09-12', 1002, 704);
INSERT INTO Orders
  VALUES (51, '2007-09-08', '2007-09-08', 1018, 707);
INSERT INTO Orders
  VALUES (52, '2007-09-09', '2007-09-11', 1001, 701);
INSERT INTO Orders
  VALUES (53, '2007-09-09', '2007-09-09', 1004, 706);
INSERT INTO Orders
  VALUES (54, '2007-09-09', '2007-09-09', 1007, 707);
INSERT INTO Orders
  VALUES (55, '2007-09-09', '2007-09-11', 1001, 707);
INSERT INTO Orders
  VALUES (56, '2007-09-09', '2007-09-12', 1014, 702);
INSERT INTO Orders
  VALUES (57, '2007-09-09', '2007-09-10', 1009, 703);
INSERT INTO Orders
  VALUES (58, '2007-09-09', '2007-09-13', 1006, 701);
INSERT INTO Orders
  VALUES (59, '2007-09-09', '2007-09-09', 1004, 704);
INSERT INTO Orders
  VALUES (60, '2007-09-09', '2007-09-13', 1013, 708);
INSERT INTO Orders
  VALUES (61, '2007-09-09', '2007-09-10', 1009, 706);
INSERT INTO Orders
  VALUES (62, '2007-09-10', '2007-09-13', 1003, 703);
INSERT INTO Orders
  VALUES (63, '2007-09-10', '2007-09-13', 1023, 708);
INSERT INTO Orders
  VALUES (64, '2007-09-10', '2007-09-14', 1027, 708);
INSERT INTO Orders
  VALUES (65, '2007-09-10', '2007-09-13', 1021, 703);
INSERT INTO Orders
  VALUES (66, '2007-09-10', '2007-09-11', 1026, 703);
INSERT INTO Orders
  VALUES (67, '2007-09-10', '2007-09-11', 1025, 702);
INSERT INTO Orders
  VALUES (68, '2007-09-11', '2007-09-12', 1027, 702);
INSERT INTO Orders
  VALUES (69, '2007-09-11', '2007-09-13', 1021, 705);
INSERT INTO Orders
  VALUES (70, '2007-09-12', '2007-09-16', 1016, 706);
INSERT INTO Orders
  VALUES (71, '2007-09-12', '2007-09-14', 1016, 708);
INSERT INTO Orders
  VALUES (72, '2007-09-12', '2007-09-16', 1003, 708);
INSERT INTO Orders
  VALUES (73, '2007-09-12', '2007-09-15', 1005, 705);
INSERT INTO Orders
  VALUES (74, '2007-09-12', '2007-09-13', 1002, 703);
INSERT INTO Orders
  VALUES (75, '2007-09-12', '2007-09-14', 1014, 706);
INSERT INTO Orders
  VALUES (76, '2007-09-12', '2007-09-15', 1012, 703);
INSERT INTO Orders
  VALUES (77, '2007-09-12', '2007-09-13', 1008, 706);
INSERT INTO Orders
  VALUES (78, '2007-09-13', '2007-09-16', 1007, 701);
INSERT INTO Orders
  VALUES (79, '2007-09-13', '2007-09-17', 1006, 703);
INSERT INTO Orders
  VALUES (80, '2007-09-13', '2007-09-16', 1025, 708);
INSERT INTO Orders
  VALUES (81, '2007-09-13', '2007-09-13', 1006, 705);
INSERT INTO Orders
  VALUES (82, '2007-09-13', '2007-09-16', 1005, 701);
INSERT INTO Orders
  VALUES (83, '2007-09-13', '2007-09-16', 1021, 708);
INSERT INTO Orders
  VALUES (84, '2007-09-13', '2007-09-13', 1022, 707);
INSERT INTO Orders
  VALUES (85, '2007-09-13', '2007-09-15', 1015, 705);
INSERT INTO Orders
  VALUES (86, '2007-09-13', '2007-09-16', 1009, 701);
INSERT INTO Orders
  VALUES (87, '2007-09-13', '2007-09-14', 1002, 704);
INSERT INTO Orders
  VALUES (88, '2007-09-14', '2007-09-17', 1026, 707);
INSERT INTO Orders
  VALUES (89, '2007-09-14', '2007-09-17', 1003, 703);
INSERT INTO Orders
  VALUES (90, '2007-09-14', '2007-09-15', 1017, 706);
INSERT INTO Orders
  VALUES (91, '2007-09-14', '2007-09-18', 1010, 703);
INSERT INTO Orders
  VALUES (92, '2007-09-14', '2007-09-17', 1011, 704);
INSERT INTO Orders
  VALUES (93, '2007-09-14', '2007-09-17', 1023, 707);
INSERT INTO Orders
  VALUES (94, '2007-09-14', '2007-09-14', 1010, 701);
INSERT INTO Orders
  VALUES (95, '2007-09-15', '2007-09-19', 1021, 704);
INSERT INTO Orders
  VALUES (96, '2007-09-15', '2007-09-16', 1025, 703);
INSERT INTO Orders
  VALUES (97, '2007-09-15', '2007-09-18', 1026, 703);
INSERT INTO Orders
  VALUES (98, '2007-09-15', '2007-09-16', 1009, 706);
INSERT INTO Orders
  VALUES (99, '2007-09-15', '2007-09-18', 1002, 703);
INSERT INTO Orders
  VALUES (100, '2007-09-15', '2007-09-16', 1002, 707);
INSERT INTO Orders
  VALUES (101, '2007-09-15', '2007-09-18', 1023, 707);
INSERT INTO Orders
  VALUES (102, '2007-09-15', '2007-09-17', 1010, 705);
INSERT INTO Orders
  VALUES (103, '2007-09-15', '2007-09-16', 1025, 702);
INSERT INTO Orders
  VALUES (104, '2007-09-15', '2007-09-15', 1017, 708);
INSERT INTO Orders
  VALUES (105, '2007-09-16', '2007-09-18', 1005, 704);
INSERT INTO Orders
  VALUES (106, '2007-09-16', '2007-09-20', 1020, 708);
INSERT INTO Orders
  VALUES (107, '2007-09-16', '2007-09-20', 1001, 703);
INSERT INTO Orders
  VALUES (108, '2007-09-16', '2007-09-19', 1004, 701);
INSERT INTO Orders
  VALUES (109, '2007-09-16', '2007-09-16', 1013, 703);
INSERT INTO Orders
  VALUES (110, '2007-09-17', '2007-09-19', 1015, 708);
INSERT INTO Orders
  VALUES (111, '2007-09-17', '2007-09-21', 1021, 707);
INSERT INTO Orders
  VALUES (112, '2007-09-18', '2007-09-19', 1009, 703);
INSERT INTO Orders
  VALUES (113, '2007-09-18', '2007-09-22', 1010, 702);
INSERT INTO Orders
  VALUES (114, '2007-09-18', '2007-09-22', 1011, 706);
INSERT INTO Orders
  VALUES (115, '2007-09-19', '2007-09-21', 1003, 704);
INSERT INTO Orders
  VALUES (116, '2007-09-19', '2007-09-21', 1004, 701);
INSERT INTO Orders
  VALUES (117, '2007-09-20', '2007-09-22', 1005, 705);
INSERT INTO Orders
  VALUES (118, '2007-09-20', '2007-09-22', 1021, 708);
INSERT INTO Orders
  VALUES (119, '2007-09-20', '2007-09-20', 1013, 701);
INSERT INTO Orders
  VALUES (120, '2007-09-20', '2007-09-21', 1024, 702);
INSERT INTO Orders
  VALUES (121, '2007-09-20', '2007-09-21', 1025, 701);
INSERT INTO Orders
  VALUES (122, '2007-09-20', '2007-09-24', 1009, 707);
INSERT INTO Orders
  VALUES (123, '2007-09-20', '2007-09-22', 1004, 704);
INSERT INTO Orders
  VALUES (124, '2007-09-21', '2007-09-23', 1007, 705);
INSERT INTO Orders
  VALUES (125, '2007-09-21', '2007-09-21', 1011, 707);
INSERT INTO Orders
  VALUES (126, '2007-09-22', '2007-09-24', 1016, 708);
INSERT INTO Orders
  VALUES (127, '2007-09-22', '2007-09-25', 1009, 705);
INSERT INTO Orders
  VALUES (128, '2007-09-22', '2007-09-26', 1022, 708);
INSERT INTO Orders
  VALUES (129, '2007-09-22', '2007-09-22', 1007, 708);
INSERT INTO Orders
  VALUES (130, '2007-09-22', '2007-09-24', 1011, 705);
INSERT INTO Orders
  VALUES (131, '2007-09-22', '2007-09-22', 1014, 706);
INSERT INTO Orders
  VALUES (132, '2007-09-22', '2007-09-25', 1007, 705);
INSERT INTO Orders
  VALUES (133, '2007-09-22', '2007-09-22', 1027, 706);
INSERT INTO Orders
  VALUES (134, '2007-09-22', '2007-09-24', 1003, 703);
INSERT INTO Orders
  VALUES (135, '2007-09-23', '2007-09-26', 1005, 701);
INSERT INTO Orders
  VALUES (136, '2007-09-23', '2007-09-26', 1008, 707);
INSERT INTO Orders
  VALUES (137, '2007-09-23', '2007-09-23', 1001, 706);
INSERT INTO Orders
  VALUES (138, '2007-09-24', '2007-09-27', 1001, 702);
INSERT INTO Orders
  VALUES (139, '2007-09-24', '2007-09-26', 1024, 704);
INSERT INTO Orders
  VALUES (140, '2007-09-24', '2007-09-24', 1002, 706);
INSERT INTO Orders
  VALUES (141, '2007-09-24', '2007-09-27', 1014, 706);
INSERT INTO Orders
  VALUES (142, '2007-09-25', '2007-09-29', 1018, 702);
INSERT INTO Orders
  VALUES (143, '2007-09-25', '2007-09-28', 1021, 706);
INSERT INTO Orders
  VALUES (144, '2007-09-25', '2007-09-29', 1018, 704);
INSERT INTO Orders
  VALUES (145, '2007-09-26', '2007-09-30', 1027, 701);
INSERT INTO Orders
  VALUES (146, '2007-09-26', '2007-09-26', 1021, 708);
INSERT INTO Orders
  VALUES (147, '2007-09-26', '2007-09-26', 1026, 708);
INSERT INTO Orders
  VALUES (148, '2007-09-26', '2007-09-30', 1027, 704);
INSERT INTO Orders
  VALUES (149, '2007-09-27', '2007-09-28', 1004, 707);
INSERT INTO Orders
  VALUES (150, '2007-09-27', '2007-09-27', 1024, 701);
INSERT INTO Orders
  VALUES (151, '2007-09-27', '2007-09-28', 1001, 707);
INSERT INTO Orders
  VALUES (152, '2007-09-28', '2007-10-02', 1017, 704);
INSERT INTO Orders
  VALUES (153, '2007-09-29', '2007-09-30', 1003, 702);
INSERT INTO Orders
  VALUES (154, '2007-09-29', '2007-10-02', 1001, 703);
INSERT INTO Orders
  VALUES (155, '2007-09-29', '2007-10-03', 1004, 703);
INSERT INTO Orders
  VALUES (156, '2007-09-29', '2007-09-30', 1004, 703);
INSERT INTO Orders
  VALUES (157, '2007-09-29', '2007-10-01', 1010, 707);
INSERT INTO Orders
  VALUES (158, '2007-09-29', '2007-10-03', 1021, 705);
INSERT INTO Orders
  VALUES (159, '2007-09-29', '2007-10-03', 1005, 707);
INSERT INTO Orders
  VALUES (160, '2007-09-30', '2007-09-30', 1021, 706);
INSERT INTO Orders
  VALUES (161, '2007-09-30', '2007-09-30', 1011, 707);
INSERT INTO Orders
  VALUES (162, '2007-09-30', '2007-10-01', 1021, 704);
INSERT INTO Orders
  VALUES (163, '2007-09-30', '2007-09-30', 1004, 707);
INSERT INTO Orders
  VALUES (164, '2007-10-01', '2007-10-04', 1021, 707);
INSERT INTO Orders
  VALUES (165, '2007-10-02', '2007-10-02', 1017, 702);
INSERT INTO Orders
  VALUES (166, '2007-10-03', '2007-10-06', 1022, 706);
INSERT INTO Orders
  VALUES (167, '2007-10-03', '2007-10-03', 1017, 706);
INSERT INTO Orders
  VALUES (168, '2007-10-03', '2007-10-05', 1027, 706);
INSERT INTO Orders
  VALUES (169, '2007-10-03', '2007-10-06', 1025, 708);
INSERT INTO Orders
  VALUES (170, '2007-10-04', '2007-10-04', 1004, 704);
INSERT INTO Orders
  VALUES (171, '2007-10-04', '2007-10-05', 1026, 707);
INSERT INTO Orders
  VALUES (172, '2007-10-04', '2007-10-07', 1018, 704);
INSERT INTO Orders
  VALUES (173, '2007-10-04', '2007-10-04', 1015, 704);
INSERT INTO Orders
  VALUES (174, '2007-10-04', '2007-10-08', 1006, 703);
INSERT INTO Orders
  VALUES (175, '2007-10-04', '2007-10-07', 1013, 706);
INSERT INTO Orders
  VALUES (176, '2007-10-04', '2007-10-04', 1025, 701);
INSERT INTO Orders
  VALUES (177, '2007-10-04', '2007-10-08', 1008, 706);
INSERT INTO Orders
  VALUES (178, '2007-10-04', '2007-10-07', 1022, 702);
INSERT INTO Orders
  VALUES (179, '2007-10-04', '2007-10-08', 1017, 708);
INSERT INTO Orders
  VALUES (180, '2007-10-05', '2007-10-08', 1015, 708);
INSERT INTO Orders
  VALUES (181, '2007-10-05', '2007-10-05', 1017, 708);
INSERT INTO Orders
  VALUES (182, '2007-10-05', '2007-10-06', 1002, 702);
INSERT INTO Orders
  VALUES (183, '2007-10-05', '2007-10-05', 1020, 708);
INSERT INTO Orders
  VALUES (184, '2007-10-05', '2007-10-09', 1023, 707);
INSERT INTO Orders
  VALUES (185, '2007-10-05', '2007-10-09', 1017, 702);
INSERT INTO Orders
  VALUES (186, '2007-10-05', '2007-10-05', 1002, 704);
INSERT INTO Orders
  VALUES (187, '2007-10-06', '2007-10-07', 1022, 702);
INSERT INTO Orders
  VALUES (188, '2007-10-06', '2007-10-07', 1002, 706);
INSERT INTO Orders
  VALUES (189, '2007-10-06', '2007-10-07', 1012, 702);
INSERT INTO Orders
  VALUES (190, '2007-10-06', '2007-10-10', 1024, 708);
INSERT INTO Orders
  VALUES (191, '2007-10-06', '2007-10-07', 1015, 701);
INSERT INTO Orders
  VALUES (192, '2007-10-06', '2007-10-09', 1022, 702);
INSERT INTO Orders
  VALUES (193, '2007-10-06', '2007-10-06', 1025, 708);
INSERT INTO Orders
  VALUES (194, '2007-10-06', '2007-10-08', 1017, 708);
INSERT INTO Orders
  VALUES (195, '2007-10-07', '2007-10-10', 1025, 703);
INSERT INTO Orders
  VALUES (196, '2007-10-07', '2007-10-11', 1009, 707);
INSERT INTO Orders
  VALUES (197, '2007-10-07', '2007-10-10', 1002, 703);
INSERT INTO Orders
  VALUES (198, '2007-10-07', '2007-10-09', 1002, 703);
INSERT INTO Orders
  VALUES (199, '2007-10-07', '2007-10-09', 1008, 707);
INSERT INTO Orders
  VALUES (200, '2007-10-07', '2007-10-08', 1026, 706);
INSERT INTO Orders
  VALUES (201, '2007-10-07', '2007-10-08', 1018, 701);
INSERT INTO Orders
  VALUES (202, '2007-10-07', '2007-10-09', 1020, 705);
INSERT INTO Orders
  VALUES (203, '2007-10-08', '2007-10-08', 1023, 708);
INSERT INTO Orders
  VALUES (204, '2007-10-08', '2007-10-08', 1026, 701);
INSERT INTO Orders
  VALUES (205, '2007-10-08', '2007-10-12', 1006, 706);
INSERT INTO Orders
  VALUES (206, '2007-10-08', '2007-10-12', 1021, 704);
INSERT INTO Orders
  VALUES (207, '2007-10-08', '2007-10-10', 1015, 704);
INSERT INTO Orders
  VALUES (208, '2007-10-09', '2007-10-11', 1019, 704);
INSERT INTO Orders
  VALUES (209, '2007-10-10', '2007-10-11', 1002, 703);
INSERT INTO Orders
  VALUES (210, '2007-10-10', '2007-10-12', 1024, 701);
INSERT INTO Orders
  VALUES (211, '2007-10-10', '2007-10-13', 1014, 701);
INSERT INTO Orders
  VALUES (212, '2007-10-10', '2007-10-11', 1007, 704);
INSERT INTO Orders
  VALUES (213, '2007-10-11', '2007-10-12', 1001, 707);
INSERT INTO Orders
  VALUES (214, '2007-10-11', '2007-10-11', 1021, 703);
INSERT INTO Orders
  VALUES (215, '2007-10-11', '2007-10-11', 1002, 708);
INSERT INTO Orders
  VALUES (216, '2007-10-11', '2007-10-11', 1016, 707);
INSERT INTO Orders
  VALUES (217, '2007-10-12', '2007-10-14', 1020, 703);
INSERT INTO Orders
  VALUES (218, '2007-10-12', '2007-10-15', 1014, 707);
INSERT INTO Orders
  VALUES (219, '2007-10-12', '2007-10-13', 1018, 706);
INSERT INTO Orders
  VALUES (220, '2007-10-12', '2007-10-14', 1014, 705);
INSERT INTO Orders
  VALUES (221, '2007-10-12', '2007-10-14', 1008, 705);
INSERT INTO Orders
  VALUES (222, '2007-10-12', '2007-10-16', 1007, 703);
INSERT INTO Orders
  VALUES (223, '2007-10-12', '2007-10-15', 1025, 708);
INSERT INTO Orders
  VALUES (224, '2007-10-12', '2007-10-15', 1011, 705);
INSERT INTO Orders
  VALUES (225, '2007-10-13', '2007-10-13', 1017, 704);
INSERT INTO Orders
  VALUES (226, '2007-10-13', '2007-10-15', 1023, 705);
INSERT INTO Orders
  VALUES (227, '2007-10-14', '2007-10-17', 1006, 704);
INSERT INTO Orders
  VALUES (228, '2007-10-15', '2007-10-15', 1017, 701);
INSERT INTO Orders
  VALUES (229, '2007-10-15', '2007-10-18', 1024, 707);
INSERT INTO Orders
  VALUES (230, '2007-10-15', '2007-10-19', 1008, 708);
INSERT INTO Orders
  VALUES (231, '2007-10-15', '2007-10-17', 1016, 706);
INSERT INTO Orders
  VALUES (232, '2007-10-15', '2007-10-16', 1017, 703);
INSERT INTO Orders
  VALUES (233, '2007-10-16', '2007-10-18', 1014, 708);
INSERT INTO Orders
  VALUES (234, '2007-10-16', '2007-10-19', 1010, 702);
INSERT INTO Orders
  VALUES (235, '2007-10-16', '2007-10-19', 1015, 705);
INSERT INTO Orders
  VALUES (236, '2007-10-17', '2007-10-19', 1021, 704);
INSERT INTO Orders
  VALUES (237, '2007-10-17', '2007-10-19', 1027, 702);
INSERT INTO Orders
  VALUES (238, '2007-10-17', '2007-10-20', 1005, 705);
INSERT INTO Orders
  VALUES (239, '2007-10-17', '2007-10-18', 1012, 703);
INSERT INTO Orders
  VALUES (240, '2007-10-18', '2007-10-18', 1022, 701);
INSERT INTO Orders
  VALUES (241, '2007-10-18', '2007-10-18', 1008, 705);
INSERT INTO Orders
  VALUES (242, '2007-10-18', '2007-10-20', 1010, 705);
INSERT INTO Orders
  VALUES (243, '2007-10-18', '2007-10-21', 1020, 708);
INSERT INTO Orders
  VALUES (244, '2007-10-18', '2007-10-21', 1014, 708);
INSERT INTO Orders
  VALUES (245, '2007-10-18', '2007-10-19', 1015, 704);
INSERT INTO Orders
  VALUES (246, '2007-10-19', '2007-10-22', 1004, 703);
INSERT INTO Orders
  VALUES (247, '2007-10-19', '2007-10-22', 1005, 702);
INSERT INTO Orders
  VALUES (248, '2007-10-19', '2007-10-20', 1021, 705);
INSERT INTO Orders
  VALUES (249, '2007-10-19', '2007-10-22', 1016, 703);
INSERT INTO Orders
  VALUES (250, '2007-10-19', '2007-10-21', 1023, 707);
INSERT INTO Orders
  VALUES (251, '2007-10-19', '2007-10-22', 1005, 705);
INSERT INTO Orders
  VALUES (252, '2007-10-19', '2007-10-20', 1010, 702);
INSERT INTO Orders
  VALUES (253, '2007-10-20', '2007-10-20', 1024, 706);
INSERT INTO Orders
  VALUES (254, '2007-10-21', '2007-10-25', 1002, 703);
INSERT INTO Orders
  VALUES (255, '2007-10-21', '2007-10-21', 1008, 707);
INSERT INTO Orders
  VALUES (256, '2007-10-21', '2007-10-21', 1016, 705);
INSERT INTO Orders
  VALUES (257, '2007-10-21', '2007-10-21', 1007, 708);
INSERT INTO Orders
  VALUES (258, '2007-10-22', '2007-10-22', 1016, 705);
INSERT INTO Orders
  VALUES (259, '2007-10-22', '2007-10-22', 1009, 702);
INSERT INTO Orders
  VALUES (260, '2007-10-22', '2007-10-22', 1006, 701);
INSERT INTO Orders
  VALUES (261, '2007-10-22', '2007-10-26', 1020, 708);
INSERT INTO Orders
  VALUES (262, '2007-10-22', '2007-10-24', 1020, 707);
INSERT INTO Orders
  VALUES (263, '2007-10-22', '2007-10-25', 1011, 705);
INSERT INTO Orders
  VALUES (264, '2007-10-22', '2007-10-22', 1002, 702);
INSERT INTO Orders
  VALUES (265, '2007-10-22', '2007-10-25', 1014, 702);
INSERT INTO Orders
  VALUES (266, '2007-10-22', '2007-10-26', 1021, 708);
INSERT INTO Orders
  VALUES (267, '2007-10-22', '2007-10-23', 1004, 706);
INSERT INTO Orders
  VALUES (268, '2007-10-23', '2007-10-24', 1021, 704);
INSERT INTO Orders
  VALUES (269, '2007-10-23', '2007-10-24', 1016, 706);
INSERT INTO Orders
  VALUES (270, '2007-10-23', '2007-10-26', 1007, 703);
INSERT INTO Orders
  VALUES (271, '2007-10-24', '2007-10-24', 1010, 702);
INSERT INTO Orders
  VALUES (272, '2007-10-24', '2007-10-26', 1005, 701);
INSERT INTO Orders
  VALUES (273, '2007-10-24', '2007-10-24', 1024, 704);
INSERT INTO Orders
  VALUES (274, '2007-10-24', '2007-10-26', 1004, 703);
INSERT INTO Orders
  VALUES (275, '2007-10-24', '2007-10-28', 1009, 701);
INSERT INTO Orders
  VALUES (276, '2007-10-24', '2007-10-24', 1018, 702);
INSERT INTO Orders
  VALUES (277, '2007-10-24', '2007-10-24', 1012, 701);
INSERT INTO Orders
  VALUES (278, '2007-10-24', '2007-10-25', 1024, 707);
INSERT INTO Orders
  VALUES (279, '2007-10-25', '2007-10-29', 1017, 706);
INSERT INTO Orders
  VALUES (280, '2007-10-25', '2007-10-27', 1016, 702);
INSERT INTO Orders
  VALUES (281, '2007-10-25', '2007-10-27', 1006, 708);
INSERT INTO Orders
  VALUES (282, '2007-10-26', '2007-10-28', 1005, 702);
INSERT INTO Orders
  VALUES (283, '2007-10-26', '2007-10-27', 1015, 702);
INSERT INTO Orders
  VALUES (284, '2007-10-26', '2007-10-30', 1016, 701);
INSERT INTO Orders
  VALUES (285, '2007-10-26', '2007-10-27', 1024, 705);
INSERT INTO Orders
  VALUES (286, '2007-10-26', '2007-10-27', 1019, 705);
INSERT INTO Orders
  VALUES (287, '2007-10-26', '2007-10-29', 1018, 708);
INSERT INTO Orders
  VALUES (288, '2007-10-26', '2007-10-30', 1027, 704);
INSERT INTO Orders
  VALUES (289, '2007-10-27', '2007-10-31', 1002, 708);
INSERT INTO Orders
  VALUES (290, '2007-10-28', '2007-10-28', 1018, 706);
INSERT INTO Orders
  VALUES (291, '2007-10-28', '2007-11-01', 1025, 705);
INSERT INTO Orders
  VALUES (292, '2007-10-28', '2007-10-28', 1013, 708);
INSERT INTO Orders
  VALUES (293, '2007-10-28', '2007-10-29', 1025, 706);
INSERT INTO Orders
  VALUES (294, '2007-10-29', '2007-10-30', 1017, 706);
INSERT INTO Orders
  VALUES (295, '2007-10-29', '2007-10-29', 1012, 701);
INSERT INTO Orders
  VALUES (296, '2007-10-29', '2007-10-29', 1014, 707);
INSERT INTO Orders
  VALUES (297, '2007-10-29', '2007-11-01', 1008, 701);
INSERT INTO Orders
  VALUES (298, '2007-10-29', '2007-11-01', 1005, 701);
INSERT INTO Orders
  VALUES (299, '2007-10-30', '2007-11-03', 1021, 704);
INSERT INTO Orders
  VALUES (300, '2007-10-30', '2007-10-30', 1011, 706);
INSERT INTO Orders
  VALUES (301, '2007-10-30', '2007-11-03', 1025, 704);
INSERT INTO Orders
  VALUES (302, '2007-10-30', '2007-11-01', 1007, 702);
INSERT INTO Orders
  VALUES (303, '2007-10-31', '2007-11-03', 1011, 705);
INSERT INTO Orders
  VALUES (304, '2007-10-31', '2007-11-04', 1015, 701);
INSERT INTO Orders
  VALUES (305, '2007-10-31', '2007-11-04', 1013, 708);
INSERT INTO Orders
  VALUES (306, '2007-10-31', '2007-11-02', 1026, 701);
INSERT INTO Orders
  VALUES (307, '2007-10-31', '2007-11-01', 1013, 704);
INSERT INTO Orders
  VALUES (308, '2007-10-31', '2007-11-01', 1002, 701);
INSERT INTO Orders
  VALUES (309, '2007-10-31', '2007-11-03', 1020, 707);
INSERT INTO Orders
  VALUES (310, '2007-10-31', '2007-11-02', 1025, 703);
INSERT INTO Orders
  VALUES (311, '2007-11-01', '2007-11-03', 1003, 708);
INSERT INTO Orders
  VALUES (312, '2007-11-01', '2007-11-01', 1003, 707);
INSERT INTO Orders
  VALUES (313, '2007-11-01', '2007-11-01', 1024, 701);
INSERT INTO Orders
  VALUES (314, '2007-11-01', '2007-11-03', 1007, 706);
INSERT INTO Orders
  VALUES (315, '2007-11-01', '2007-11-05', 1024, 702);
INSERT INTO Orders
  VALUES (316, '2007-11-01', '2007-11-05', 1018, 705);
INSERT INTO Orders
  VALUES (317, '2007-11-01', '2007-11-01', 1012, 703);
INSERT INTO Orders
  VALUES (318, '2007-11-01', '2007-11-02', 1024, 703);
INSERT INTO Orders
  VALUES (319, '2007-11-02', '2007-11-03', 1005, 701);
INSERT INTO Orders
  VALUES (320, '2007-11-02', '2007-11-06', 1001, 707);
INSERT INTO Orders
  VALUES (321, '2007-11-02', '2007-11-04', 1011, 701);
INSERT INTO Orders
  VALUES (322, '2007-11-02', '2007-11-03', 1001, 701);
INSERT INTO Orders
  VALUES (323, '2007-11-02', '2007-11-04', 1011, 706);
INSERT INTO Orders
  VALUES (324, '2007-11-02', '2007-11-03', 1016, 704);
INSERT INTO Orders
  VALUES (325, '2007-11-02', '2007-11-03', 1002, 706);
INSERT INTO Orders
  VALUES (326, '2007-11-02', '2007-11-06', 1024, 704);
INSERT INTO Orders
  VALUES (327, '2007-11-02', '2007-11-02', 1012, 703);
INSERT INTO Orders
  VALUES (328, '2007-11-02', '2007-11-05', 1009, 702);
INSERT INTO Orders
  VALUES (329, '2007-11-03', '2007-11-05', 1004, 708);
INSERT INTO Orders
  VALUES (330, '2007-11-03', '2007-11-06', 1021, 708);
INSERT INTO Orders
  VALUES (331, '2007-11-03', '2007-11-05', 1018, 702);
INSERT INTO Orders
  VALUES (332, '2007-11-04', '2007-11-04', 1006, 704);
INSERT INTO Orders
  VALUES (333, '2007-11-04', '2007-11-06', 1003, 708);
INSERT INTO Orders
  VALUES (334, '2007-11-04', '2007-11-08', 1009, 707);
INSERT INTO Orders
  VALUES (335, '2007-11-04', '2007-11-05', 1020, 703);
INSERT INTO Orders
  VALUES (336, '2007-11-05', '2007-11-06', 1020, 703);
INSERT INTO Orders
  VALUES (337, '2007-11-05', '2007-11-06', 1011, 706);
INSERT INTO Orders
  VALUES (338, '2007-11-05', '2007-11-05', 1009, 708);
INSERT INTO Orders
  VALUES (339, '2007-11-05', '2007-11-09', 1005, 705);
INSERT INTO Orders
  VALUES (340, '2007-11-05', '2007-11-09', 1026, 707);
INSERT INTO Orders
  VALUES (341, '2007-11-06', '2007-11-07', 1022, 704);
INSERT INTO Orders
  VALUES (342, '2007-11-07', '2007-11-09', 1013, 702);
INSERT INTO Orders
  VALUES (343, '2007-11-07', '2007-11-10', 1025, 708);
INSERT INTO Orders
  VALUES (344, '2007-11-07', '2007-11-11', 1005, 702);
INSERT INTO Orders
  VALUES (345, '2007-11-07', '2007-11-10', 1008, 701);
INSERT INTO Orders
  VALUES (346, '2007-11-07', '2007-11-11', 1001, 702);
INSERT INTO Orders
  VALUES (347, '2007-11-08', '2007-11-08', 1020, 705);
INSERT INTO Orders
  VALUES (348, '2007-11-08', '2007-11-10', 1015, 703);
INSERT INTO Orders
  VALUES (349, '2007-11-08', '2007-11-09', 1001, 703);
INSERT INTO Orders
  VALUES (350, '2007-11-08', '2007-11-10', 1019, 703);
INSERT INTO Orders
  VALUES (351, '2007-11-09', '2007-11-13', 1012, 704);
INSERT INTO Orders
  VALUES (352, '2007-11-09', '2007-11-10', 1020, 706);
INSERT INTO Orders
  VALUES (353, '2007-11-09', '2007-11-13', 1026, 704);
INSERT INTO Orders
  VALUES (354, '2007-11-10', '2007-11-11', 1021, 706);
INSERT INTO Orders
  VALUES (355, '2007-11-10', '2007-11-11', 1014, 702);
INSERT INTO Orders
  VALUES (356, '2007-11-10', '2007-11-14', 1018, 702);
INSERT INTO Orders
  VALUES (357, '2007-11-10', '2007-11-12', 1003, 705);
INSERT INTO Orders
  VALUES (358, '2007-11-10', '2007-11-14', 1012, 701);
INSERT INTO Orders
  VALUES (359, '2007-11-11', '2007-11-12', 1024, 707);
INSERT INTO Orders
  VALUES (360, '2007-11-11', '2007-11-13', 1013, 707);
INSERT INTO Orders
  VALUES (361, '2007-11-11', '2007-11-12', 1016, 706);
INSERT INTO Orders
  VALUES (362, '2007-11-11', '2007-11-12', 1012, 701);
INSERT INTO Orders
  VALUES (363, '2007-11-11', '2007-11-12', 1010, 706);
INSERT INTO Orders
  VALUES (364, '2007-11-11', '2007-11-14', 1010, 705);
INSERT INTO Orders
  VALUES (365, '2007-11-11', '2007-11-12', 1011, 705);
INSERT INTO Orders
  VALUES (366, '2007-11-11', '2007-11-12', 1004, 708);
INSERT INTO Orders
  VALUES (367, '2007-11-11', '2007-11-11', 1011, 703);
INSERT INTO Orders
  VALUES (368, '2007-11-12', '2007-11-13', 1017, 708);
INSERT INTO Orders
  VALUES (369, '2007-11-12', '2007-11-13', 1003, 707);
INSERT INTO Orders
  VALUES (370, '2007-11-12', '2007-11-12', 1025, 708);
INSERT INTO Orders
  VALUES (371, '2007-11-12', '2007-11-15', 1009, 701);
INSERT INTO Orders
  VALUES (372, '2007-11-12', '2007-11-14', 1025, 707);
INSERT INTO Orders
  VALUES (373, '2007-11-12', '2007-11-15', 1014, 701);
INSERT INTO Orders
  VALUES (374, '2007-11-12', '2007-11-12', 1005, 701);
INSERT INTO Orders
  VALUES (375, '2007-11-13', '2007-11-15', 1004, 704);
INSERT INTO Orders
  VALUES (376, '2007-11-13', '2007-11-13', 1015, 704);
INSERT INTO Orders
  VALUES (377, '2007-11-13', '2007-11-17', 1019, 705);
INSERT INTO Orders
  VALUES (378, '2007-11-13', '2007-11-14', 1014, 707);
INSERT INTO Orders
  VALUES (379, '2007-11-13', '2007-11-17', 1025, 706);
INSERT INTO Orders
  VALUES (380, '2007-11-13', '2007-11-16', 1023, 704);
INSERT INTO Orders
  VALUES (381, '2007-11-14', '2007-11-16', 1012, 701);
INSERT INTO Orders
  VALUES (382, '2007-11-15', '2007-11-15', 1017, 705);
INSERT INTO Orders
  VALUES (383, '2007-11-16', '2007-11-19', 1017, 702);
INSERT INTO Orders
  VALUES (384, '2007-11-16', '2007-11-16', 1021, 708);
INSERT INTO Orders
  VALUES (385, '2007-11-17', '2007-11-20', 1019, 701);
INSERT INTO Orders
  VALUES (386, '2007-11-17', '2007-11-17', 1021, 705);
INSERT INTO Orders
  VALUES (387, '2007-11-17', '2007-11-21', 1010, 708);
INSERT INTO Orders
  VALUES (388, '2007-11-17', '2007-11-21', 1008, 705);
INSERT INTO Orders
  VALUES (389, '2007-11-17', '2007-11-20', 1005, 706);
INSERT INTO Orders
  VALUES (390, '2007-11-17', '2007-11-20', 1016, 708);
INSERT INTO Orders
  VALUES (391, '2007-11-17', '2007-11-17', 1024, 702);
INSERT INTO Orders
  VALUES (392, '2007-11-17', '2007-11-21', 1006, 708);
INSERT INTO Orders
  VALUES (393, '2007-11-18', '2007-11-20', 1011, 704);
INSERT INTO Orders
  VALUES (394, '2007-11-18', '2007-11-21', 1001, 702);
INSERT INTO Orders
  VALUES (395, '2007-11-19', '2007-11-23', 1014, 703);
INSERT INTO Orders
  VALUES (396, '2007-11-19', '2007-11-20', 1019, 706);
INSERT INTO Orders
  VALUES (397, '2007-11-19', '2007-11-19', 1020, 701);
INSERT INTO Orders
  VALUES (398, '2007-11-20', '2007-11-22', 1004, 708);
INSERT INTO Orders
  VALUES (399, '2007-11-20', '2007-11-23', 1007, 704);
INSERT INTO Orders
  VALUES (400, '2007-11-20', '2007-11-24', 1026, 705);
INSERT INTO Orders
  VALUES (401, '2007-11-20', '2007-11-21', 1003, 702);
INSERT INTO Orders
  VALUES (402, '2007-11-20', '2007-11-22', 1017, 704);
INSERT INTO Orders
  VALUES (403, '2007-11-20', '2007-11-20', 1006, 702);
INSERT INTO Orders
  VALUES (404, '2007-11-20', '2007-11-21', 1019, 708);
INSERT INTO Orders
  VALUES (405, '2007-11-20', '2007-11-23', 1023, 702);
INSERT INTO Orders
  VALUES (406, '2007-11-21', '2007-11-25', 1012, 706);
INSERT INTO Orders
  VALUES (407, '2007-11-22', '2007-11-25', 1001, 701);
INSERT INTO Orders
  VALUES (408, '2007-11-23', '2007-11-27', 1001, 703);
INSERT INTO Orders
  VALUES (409, '2007-11-23', '2007-11-24', 1024, 704);
INSERT INTO Orders
  VALUES (410, '2007-11-23', '2007-11-24', 1008, 702);
INSERT INTO Orders
  VALUES (411, '2007-11-24', '2007-11-25', 1002, 708);
INSERT INTO Orders
  VALUES (412, '2007-11-24', '2007-11-27', 1026, 708);
INSERT INTO Orders
  VALUES (413, '2007-11-24', '2007-11-25', 1001, 708);
INSERT INTO Orders
  VALUES (414, '2007-11-24', '2007-11-28', 1020, 703);
INSERT INTO Orders
  VALUES (415, '2007-11-24', '2007-11-27', 1013, 705);
INSERT INTO Orders
  VALUES (416, '2007-11-24', '2007-11-25', 1024, 705);
INSERT INTO Orders
  VALUES (417, '2007-11-24', '2007-11-27', 1017, 703);
INSERT INTO Orders
  VALUES (418, '2007-11-24', '2007-11-24', 1012, 705);
INSERT INTO Orders
  VALUES (419, '2007-11-25', '2007-11-25', 1006, 708);
INSERT INTO Orders
  VALUES (420, '2007-11-25', '2007-11-25', 1024, 704);
INSERT INTO Orders
  VALUES (421, '2007-11-25', '2007-11-28', 1022, 704);
INSERT INTO Orders
  VALUES (422, '2007-11-25', '2007-11-26', 1027, 707);
INSERT INTO Orders
  VALUES (423, '2007-11-25', '2007-11-29', 1010, 708);
INSERT INTO Orders
  VALUES (424, '2007-11-25', '2007-11-27', 1025, 706);
INSERT INTO Orders
  VALUES (425, '2007-11-26', '2007-11-30', 1001, 707);
INSERT INTO Orders
  VALUES (426, '2007-11-26', '2007-11-29', 1001, 707);
INSERT INTO Orders
  VALUES (427, '2007-11-26', '2007-11-29', 1020, 702);
INSERT INTO Orders
  VALUES (428, '2007-11-26', '2007-11-27', 1024, 703);
INSERT INTO Orders
  VALUES (429, '2007-11-26', '2007-11-29', 1016, 701);
INSERT INTO Orders
  VALUES (430, '2007-11-26', '2007-11-30', 1009, 707);
INSERT INTO Orders
  VALUES (431, '2007-11-27', '2007-11-30', 1016, 705);
INSERT INTO Orders
  VALUES (432, '2007-11-27', '2007-11-30', 1022, 702);
INSERT INTO Orders
  VALUES (433, '2007-11-27', '2007-11-27', 1017, 708);
INSERT INTO Orders
  VALUES (434, '2007-11-27', '2007-11-29', 1012, 703);
INSERT INTO Orders
  VALUES (435, '2007-11-27', '2007-11-29', 1016, 706);
INSERT INTO Orders
  VALUES (436, '2007-11-27', '2007-11-30', 1014, 703);
INSERT INTO Orders
  VALUES (437, '2007-11-27', '2007-11-29', 1002, 705);
INSERT INTO Orders
  VALUES (438, '2007-11-27', '2007-12-01', 1020, 708);
INSERT INTO Orders
  VALUES (439, '2007-11-28', '2007-12-02', 1025, 703);
INSERT INTO Orders
  VALUES (440, '2007-11-28', '2007-11-29', 1027, 708);
INSERT INTO Orders
  VALUES (441, '2007-11-28', '2007-11-28', 1010, 701);
INSERT INTO Orders
  VALUES (442, '2007-11-28', '2007-12-01', 1002, 705);
INSERT INTO Orders
  VALUES (443, '2007-11-29', '2007-12-02', 1001, 704);
INSERT INTO Orders
  VALUES (444, '2007-11-29', '2007-11-30', 1002, 706);
INSERT INTO Orders
  VALUES (445, '2007-11-29', '2007-11-30', 1007, 705);
INSERT INTO Orders
  VALUES (446, '2007-11-29', '2007-12-03', 1010, 708);
INSERT INTO Orders
  VALUES (447, '2007-11-29', '2007-11-30', 1018, 702);
INSERT INTO Orders
  VALUES (448, '2007-11-29', '2007-12-01', 1001, 701);
INSERT INTO Orders
  VALUES (449, '2007-11-29', '2007-11-29', 1025, 707);
INSERT INTO Orders
  VALUES (450, '2007-11-30', '2007-12-04', 1004, 705);
INSERT INTO Orders
  VALUES (451, '2007-11-30', '2007-12-02', 1003, 706);
INSERT INTO Orders
  VALUES (452, '2007-11-30', '2007-12-02', 1001, 702);
INSERT INTO Orders
  VALUES (453, '2007-11-30', '2007-12-04', 1027, 708);
INSERT INTO Orders
  VALUES (454, '2007-11-30', '2007-12-02', 1010, 703);
INSERT INTO Orders
  VALUES (455, '2007-11-30', '2007-12-01', 1005, 702);
INSERT INTO Orders
  VALUES (456, '2007-12-01', '2007-12-02', 1015, 705);
INSERT INTO Orders
  VALUES (457, '2007-12-01', '2007-12-05', 1019, 701);
INSERT INTO Orders
  VALUES (458, '2007-12-02', '2007-12-02', 1003, 702);
INSERT INTO Orders
  VALUES (459, '2007-12-02', '2007-12-03', 1007, 707);
INSERT INTO Orders
  VALUES (460, '2007-12-03', '2007-12-05', 1013, 704);
INSERT INTO Orders
  VALUES (461, '2007-12-03', '2007-12-07', 1021, 703);
INSERT INTO Orders
  VALUES (462, '2007-12-03', '2007-12-03', 1004, 705);
INSERT INTO Orders
  VALUES (463, '2007-12-04', '2007-12-07', 1015, 705);
INSERT INTO Orders
  VALUES (464, '2007-12-04', '2007-12-07', 1020, 705);
INSERT INTO Orders
  VALUES (465, '2007-12-04', '2007-12-04', 1012, 706);
INSERT INTO Orders
  VALUES (466, '2007-12-05', '2007-12-06', 1026, 704);
INSERT INTO Orders
  VALUES (467, '2007-12-05', '2007-12-05', 1013, 706);
INSERT INTO Orders
  VALUES (468, '2007-12-05', '2007-12-06', 1010, 708);
INSERT INTO Orders
  VALUES (469, '2007-12-05', '2007-12-05', 1011, 708);
INSERT INTO Orders
  VALUES (470, '2007-12-05', '2007-12-08', 1014, 703);
INSERT INTO Orders
  VALUES (471, '2007-12-05', '2007-12-07', 1025, 701);
INSERT INTO Orders
  VALUES (472, '2007-12-05', '2007-12-09', 1023, 707);
INSERT INTO Orders
  VALUES (473, '2007-12-05', '2007-12-08', 1016, 702);
INSERT INTO Orders
  VALUES (474, '2007-12-05', '2007-12-08', 1006, 703);
INSERT INTO Orders
  VALUES (475, '2007-12-06', '2007-12-10', 1001, 702);
INSERT INTO Orders
  VALUES (476, '2007-12-06', '2007-12-10', 1014, 705);
INSERT INTO Orders
  VALUES (477, '2007-12-06', '2007-12-06', 1009, 708);
INSERT INTO Orders
  VALUES (478, '2007-12-06', '2007-12-10', 1004, 707);
INSERT INTO Orders
  VALUES (479, '2007-12-06', '2007-12-09', 1024, 705);
INSERT INTO Orders
  VALUES (480, '2007-12-06', '2007-12-06', 1011, 703);
INSERT INTO Orders
  VALUES (481, '2007-12-07', '2007-12-10', 1009, 702);
INSERT INTO Orders
  VALUES (482, '2007-12-07', '2007-12-07', 1011, 705);
INSERT INTO Orders
  VALUES (483, '2007-12-07', '2007-12-08', 1005, 704);
INSERT INTO Orders
  VALUES (484, '2007-12-08', '2007-12-09', 1021, 707);
INSERT INTO Orders
  VALUES (485, '2007-12-08', '2007-12-10', 1003, 707);
INSERT INTO Orders
  VALUES (486, '2007-12-08', '2007-12-09', 1022, 705);
INSERT INTO Orders
  VALUES (487, '2007-12-08', '2007-12-10', 1009, 704);
INSERT INTO Orders
  VALUES (488, '2007-12-08', '2007-12-10', 1025, 703);
INSERT INTO Orders
  VALUES (489, '2007-12-08', '2007-12-08', 1005, 701);
INSERT INTO Orders
  VALUES (490, '2007-12-08', '2007-12-10', 1009, 702);
INSERT INTO Orders
  VALUES (491, '2007-12-08', '2007-12-09', 1007, 708);
INSERT INTO Orders
  VALUES (492, '2007-12-09', '2007-12-11', 1008, 702);
INSERT INTO Orders
  VALUES (493, '2007-12-09', '2007-12-13', 1005, 708);
INSERT INTO Orders
  VALUES (494, '2007-12-09', '2007-12-13', 1012, 701);
INSERT INTO Orders
  VALUES (495, '2007-12-09', '2007-12-10', 1012, 702);
INSERT INTO Orders
  VALUES (496, '2007-12-10', '2007-12-10', 1014, 701);
INSERT INTO Orders
  VALUES (497, '2007-12-10', '2007-12-11', 1002, 701);
INSERT INTO Orders
  VALUES (498, '2007-12-10', '2007-12-12', 1018, 708);
INSERT INTO Orders
  VALUES (499, '2007-12-10', '2007-12-14', 1016, 704);
INSERT INTO Orders
  VALUES (500, '2007-12-10', '2007-12-10', 1007, 705);
INSERT INTO Orders
  VALUES (501, '2007-12-11', '2007-12-14', 1001, 702);
INSERT INTO Orders
  VALUES (502, '2007-12-11', '2007-12-14', 1025, 707);
INSERT INTO Orders
  VALUES (503, '2007-12-11', '2007-12-13', 1026, 706);
INSERT INTO Orders
  VALUES (504, '2007-12-11', '2007-12-14', 1004, 707);
INSERT INTO Orders
  VALUES (505, '2007-12-11', '2007-12-15', 1006, 707);
INSERT INTO Orders
  VALUES (506, '2007-12-11', '2007-12-13', 1016, 704);
INSERT INTO Orders
  VALUES (507, '2007-12-11', '2007-12-11', 1017, 705);
INSERT INTO Orders
  VALUES (508, '2007-12-11', '2007-12-14', 1012, 704);
INSERT INTO Orders
  VALUES (509, '2007-12-12', '2007-12-13', 1010, 701);
INSERT INTO Orders
  VALUES (510, '2007-12-12', '2007-12-13', 1015, 703);
INSERT INTO Orders
  VALUES (511, '2007-12-12', '2007-12-12', 1026, 706);
INSERT INTO Orders
  VALUES (512, '2007-12-12', '2007-12-14', 1027, 708);
INSERT INTO Orders
  VALUES (513, '2007-12-12', '2007-12-15', 1012, 707);
INSERT INTO Orders
  VALUES (514, '2007-12-12', '2007-12-14', 1025, 705);
INSERT INTO Orders
  VALUES (515, '2007-12-12', '2007-12-15', 1003, 705);
INSERT INTO Orders
  VALUES (516, '2007-12-12', '2007-12-16', 1021, 703);
INSERT INTO Orders
  VALUES (517, '2007-12-13', '2007-12-15', 1007, 706);
INSERT INTO Orders
  VALUES (518, '2007-12-13', '2007-12-14', 1007, 704);
INSERT INTO Orders
  VALUES (519, '2007-12-13', '2007-12-15', 1018, 701);
INSERT INTO Orders
  VALUES (520, '2007-12-13', '2007-12-17', 1027, 704);
INSERT INTO Orders
  VALUES (521, '2007-12-13', '2007-12-17', 1009, 708);
INSERT INTO Orders
  VALUES (522, '2007-12-13', '2007-12-17', 1009, 708);
INSERT INTO Orders
  VALUES (523, '2007-12-14', '2007-12-16', 1003, 704);
INSERT INTO Orders
  VALUES (524, '2007-12-15', '2007-12-19', 1002, 701);
INSERT INTO Orders
  VALUES (525, '2007-12-15', '2007-12-18', 1019, 705);
INSERT INTO Orders
  VALUES (526, '2007-12-15', '2007-12-18', 1011, 705);
INSERT INTO Orders
  VALUES (527, '2007-12-15', '2007-12-19', 1009, 707);
INSERT INTO Orders
  VALUES (528, '2007-12-16', '2007-12-17', 1026, 701);
INSERT INTO Orders
  VALUES (529, '2007-12-16', '2007-12-18', 1013, 703);
INSERT INTO Orders
  VALUES (530, '2007-12-16', '2007-12-18', 1009, 701);
INSERT INTO Orders
  VALUES (531, '2007-12-16', '2007-12-16', 1012, 707);
INSERT INTO Orders
  VALUES (532, '2007-12-17', '2007-12-18', 1027, 706);
INSERT INTO Orders
  VALUES (533, '2007-12-17', '2007-12-20', 1017, 702);
INSERT INTO Orders
  VALUES (534, '2007-12-17', '2007-12-17', 1017, 706);
INSERT INTO Orders
  VALUES (535, '2007-12-17', '2007-12-18', 1020, 703);
INSERT INTO Orders
  VALUES (536, '2007-12-17', '2007-12-20', 1020, 702);
INSERT INTO Orders
  VALUES (537, '2007-12-17', '2007-12-20', 1003, 703);
INSERT INTO Orders
  VALUES (538, '2007-12-18', '2007-12-19', 1008, 703);
INSERT INTO Orders
  VALUES (539, '2007-12-19', '2007-12-23', 1008, 701);
INSERT INTO Orders
  VALUES (540, '2007-12-19', '2007-12-23', 1007, 707);
INSERT INTO Orders
  VALUES (541, '2007-12-20', '2007-12-22', 1006, 701);
INSERT INTO Orders
  VALUES (542, '2007-12-21', '2007-12-24', 1008, 704);
INSERT INTO Orders
  VALUES (543, '2007-12-21', '2007-12-24', 1005, 707);
INSERT INTO Orders
  VALUES (544, '2007-12-21', '2007-12-21', 1009, 704);
INSERT INTO Orders
  VALUES (545, '2007-12-21', '2007-12-25', 1010, 707);
INSERT INTO Orders
  VALUES (546, '2007-12-21', '2007-12-21', 1013, 702);
INSERT INTO Orders
  VALUES (547, '2007-12-21', '2007-12-21', 1011, 708);
INSERT INTO Orders
  VALUES (548, '2007-12-21', '2007-12-23', 1004, 707);
INSERT INTO Orders
  VALUES (549, '2007-12-21', '2007-12-21', 1024, 703);
INSERT INTO Orders
  VALUES (550, '2007-12-22', '2007-12-24', 1003, 706);
INSERT INTO Orders
  VALUES (551, '2007-12-23', '2007-12-27', 1010, 705);
INSERT INTO Orders
  VALUES (552, '2007-12-23', '2007-12-26', 1023, 705);
INSERT INTO Orders
  VALUES (553, '2007-12-23', '2007-12-27', 1002, 705);
INSERT INTO Orders
  VALUES (554, '2007-12-23', '2007-12-24', 1002, 701);
INSERT INTO Orders
  VALUES (555, '2007-12-23', '2007-12-26', 1003, 703);
INSERT INTO Orders
  VALUES (556, '2007-12-23', '2007-12-27', 1019, 701);
INSERT INTO Orders
  VALUES (557, '2007-12-23', '2007-12-23', 1026, 702);
INSERT INTO Orders
  VALUES (558, '2007-12-24', '2007-12-25', 1009, 708);
INSERT INTO Orders
  VALUES (559, '2007-12-24', '2007-12-26', 1011, 706);
INSERT INTO Orders
  VALUES (560, '2007-12-24', '2007-12-28', 1016, 707);
INSERT INTO Orders
  VALUES (561, '2007-12-24', '2007-12-27', 1025, 704);
INSERT INTO Orders
  VALUES (562, '2007-12-24', '2007-12-27', 1006, 705);
INSERT INTO Orders
  VALUES (563, '2007-12-24', '2007-12-25', 1020, 704);
INSERT INTO Orders
  VALUES (564, '2007-12-24', '2007-12-26', 1001, 706);
INSERT INTO Orders
  VALUES (565, '2007-12-25', '2007-12-27', 1014, 705);
INSERT INTO Orders
  VALUES (566, '2007-12-25', '2007-12-26', 1007, 706);
INSERT INTO Orders
  VALUES (567, '2007-12-25', '2007-12-27', 1001, 703);
INSERT INTO Orders
  VALUES (568, '2007-12-25', '2007-12-26', 1024, 704);
INSERT INTO Orders
  VALUES (569, '2007-12-25', '2007-12-27', 1004, 707);
INSERT INTO Orders
  VALUES (570, '2007-12-25', '2007-12-29', 1022, 707);
INSERT INTO Orders
  VALUES (571, '2007-12-26', '2007-12-29', 1019, 704);
INSERT INTO Orders
  VALUES (572, '2007-12-26', '2007-12-26', 1003, 703);
INSERT INTO Orders
  VALUES (573, '2007-12-26', '2007-12-28', 1019, 701);
INSERT INTO Orders
  VALUES (574, '2007-12-26', '2007-12-26', 1003, 704);
INSERT INTO Orders
  VALUES (575, '2007-12-26', '2007-12-30', 1027, 707);
INSERT INTO Orders
  VALUES (576, '2007-12-27', '2007-12-27', 1005, 705);
INSERT INTO Orders
  VALUES (577, '2007-12-27', '2007-12-27', 1014, 706);
INSERT INTO Orders
  VALUES (578, '2007-12-27', '2007-12-28', 1026, 708);
INSERT INTO Orders
  VALUES (579, '2007-12-27', '2007-12-31', 1012, 707);
INSERT INTO Orders
  VALUES (580, '2007-12-27', '2007-12-27', 1011, 705);
INSERT INTO Orders
  VALUES (581, '2007-12-28', '2007-12-28', 1003, 704);
INSERT INTO Orders
  VALUES (582, '2007-12-28', '2007-12-31', 1004, 703);
INSERT INTO Orders
  VALUES (583, '2007-12-28', '2007-12-28', 1003, 702);
INSERT INTO Orders
  VALUES (584, '2007-12-29', '2007-12-31', 1004, 707);
INSERT INTO Orders
  VALUES (585, '2007-12-29', '2007-12-29', 1009, 704);
INSERT INTO Orders
  VALUES (586, '2007-12-29', '2007-12-30', 1023, 707);
INSERT INTO Orders
  VALUES (587, '2007-12-29', '2008-01-02', 1001, 701);
INSERT INTO Orders
  VALUES (588, '2007-12-29', '2007-12-29', 1003, 701);
INSERT INTO Orders
  VALUES (589, '2007-12-29', '2007-12-29', 1013, 708);
INSERT INTO Orders
  VALUES (590, '2007-12-29', '2008-01-02', 1018, 708);
INSERT INTO Orders
  VALUES (591, '2007-12-30', '2008-01-02', 1023, 702);
INSERT INTO Orders
  VALUES (592, '2007-12-30', '2008-01-01', 1005, 707);
INSERT INTO Orders
  VALUES (593, '2007-12-30', '2008-01-02', 1026, 701);
INSERT INTO Orders
  VALUES (594, '2007-12-30', '2007-12-30', 1017, 706);
INSERT INTO Orders
  VALUES (595, '2007-12-31', '2008-01-03', 1015, 703);
INSERT INTO Orders
  VALUES (596, '2007-12-31', '2008-01-04', 1001, 702);
INSERT INTO Orders
  VALUES (597, '2007-12-31', '2007-12-31', 1006, 707);
INSERT INTO Orders
  VALUES (598, '2007-12-31', '2008-01-01', 1013, 701);
INSERT INTO Orders
  VALUES (599, '2008-01-01', '2008-01-01', 1011, 703);
INSERT INTO Orders
  VALUES (600, '2008-01-01', '2008-01-05', 1006, 704);
INSERT INTO Orders
  VALUES (601, '2008-01-01', '2008-01-02', 1011, 706);
INSERT INTO Orders
  VALUES (602, '2008-01-01', '2008-01-05', 1025, 708);
INSERT INTO Orders
  VALUES (603, '2008-01-01', '2008-01-03', 1015, 707);
INSERT INTO Orders
  VALUES (604, '2008-01-01', '2008-01-02', 1006, 702);
INSERT INTO Orders
  VALUES (605, '2008-01-01', '2008-01-02', 1020, 701);
INSERT INTO Orders
  VALUES (606, '2008-01-02', '2008-01-03', 1007, 702);
INSERT INTO Orders
  VALUES (607, '2008-01-02', '2008-01-05', 1012, 704);
INSERT INTO Orders
  VALUES (608, '2008-01-02', '2008-01-06', 1001, 706);
INSERT INTO Orders
  VALUES (609, '2008-01-02', '2008-01-06', 1017, 705);
INSERT INTO Orders
  VALUES (610, '2008-01-02', '2008-01-02', 1020, 704);
INSERT INTO Orders
  VALUES (611, '2008-01-02', '2008-01-04', 1005, 706);
INSERT INTO Orders
  VALUES (612, '2008-01-02', '2008-01-03', 1005, 705);
INSERT INTO Orders
  VALUES (613, '2008-01-03', '2008-01-05', 1015, 706);
INSERT INTO Orders
  VALUES (614, '2008-01-04', '2008-01-05', 1004, 704);
INSERT INTO Orders
  VALUES (615, '2008-01-05', '2008-01-06', 1027, 707);
INSERT INTO Orders
  VALUES (616, '2008-01-05', '2008-01-06', 1022, 705);
INSERT INTO Orders
  VALUES (617, '2008-01-05', '2008-01-05', 1012, 702);
INSERT INTO Orders
  VALUES (618, '2008-01-05', '2008-01-09', 1026, 707);
INSERT INTO Orders
  VALUES (619, '2008-01-05', '2008-01-06', 1008, 707);
INSERT INTO Orders
  VALUES (620, '2008-01-05', '2008-01-07', 1023, 702);
INSERT INTO Orders
  VALUES (621, '2008-01-05', '2008-01-08', 1007, 707);
INSERT INTO Orders
  VALUES (622, '2008-01-06', '2008-01-06', 1002, 707);
INSERT INTO Orders
  VALUES (623, '2008-01-06', '2008-01-08', 1007, 708);
INSERT INTO Orders
  VALUES (624, '2008-01-06', '2008-01-09', 1014, 701);
INSERT INTO Orders
  VALUES (625, '2008-01-06', '2008-01-08', 1006, 708);
INSERT INTO Orders
  VALUES (626, '2008-01-06', '2008-01-10', 1023, 702);
INSERT INTO Orders
  VALUES (627, '2008-01-06', '2008-01-08', 1027, 705);
INSERT INTO Orders
  VALUES (628, '2008-01-06', '2008-01-07', 1026, 704);
INSERT INTO Orders
  VALUES (629, '2008-01-07', '2008-01-11', 1014, 704);
INSERT INTO Orders
  VALUES (630, '2008-01-07', '2008-01-09', 1026, 702);
INSERT INTO Orders
  VALUES (631, '2008-01-07', '2008-01-07', 1012, 707);
INSERT INTO Orders
  VALUES (632, '2008-01-07', '2008-01-11', 1001, 706);
INSERT INTO Orders
  VALUES (633, '2008-01-07', '2008-01-09', 1021, 705);
INSERT INTO Orders
  VALUES (634, '2008-01-07', '2008-01-11', 1002, 703);
INSERT INTO Orders
  VALUES (635, '2008-01-07', '2008-01-10', 1002, 703);
INSERT INTO Orders
  VALUES (636, '2008-01-07', '2008-01-10', 1002, 703);
INSERT INTO Orders
  VALUES (637, '2008-01-07', '2008-01-10', 1008, 702);
INSERT INTO Orders
  VALUES (638, '2008-01-07', '2008-01-09', 1003, 705);
INSERT INTO Orders
  VALUES (639, '2008-01-08', '2008-01-10', 1019, 705);
INSERT INTO Orders
  VALUES (640, '2008-01-08', '2008-01-11', 1008, 706);
INSERT INTO Orders
  VALUES (641, '2008-01-08', '2008-01-11', 1012, 701);
INSERT INTO Orders
  VALUES (642, '2008-01-08', '2008-01-10', 1012, 708);
INSERT INTO Orders
  VALUES (643, '2008-01-08', '2008-01-11', 1011, 701);
INSERT INTO Orders
  VALUES (644, '2008-01-08', '2008-01-09', 1021, 706);
INSERT INTO Orders
  VALUES (645, '2008-01-08', '2008-01-12', 1024, 703);
INSERT INTO Orders
  VALUES (646, '2008-01-08', '2008-01-09', 1017, 705);
INSERT INTO Orders
  VALUES (647, '2008-01-09', '2008-01-13', 1014, 703);
INSERT INTO Orders
  VALUES (648, '2008-01-09', '2008-01-10', 1015, 701);
INSERT INTO Orders
  VALUES (649, '2008-01-09', '2008-01-13', 1001, 707);
INSERT INTO Orders
  VALUES (650, '2008-01-09', '2008-01-09', 1005, 706);
INSERT INTO Orders
  VALUES (651, '2008-01-09', '2008-01-12', 1025, 704);
INSERT INTO Orders
  VALUES (652, '2008-01-10', '2008-01-10', 1024, 701);
INSERT INTO Orders
  VALUES (653, '2008-01-10', '2008-01-13', 1015, 701);
INSERT INTO Orders
  VALUES (654, '2008-01-10', '2008-01-14', 1024, 704);
INSERT INTO Orders
  VALUES (655, '2008-01-10', '2008-01-14', 1007, 701);
INSERT INTO Orders
  VALUES (656, '2008-01-10', '2008-01-10', 1024, 707);
INSERT INTO Orders
  VALUES (657, '2008-01-10', '2008-01-13', 1001, 706);
INSERT INTO Orders
  VALUES (658, '2008-01-10', '2008-01-10', 1010, 701);
INSERT INTO Orders
  VALUES (659, '2008-01-10', '2008-01-12', 1023, 705);
INSERT INTO Orders
  VALUES (660, '2008-01-11', '2008-01-14', 1027, 702);
INSERT INTO Orders
  VALUES (661, '2008-01-11', '2008-01-15', 1011, 706);
INSERT INTO Orders
  VALUES (662, '2008-01-11', '2008-01-13', 1006, 706);
INSERT INTO Orders
  VALUES (663, '2008-01-11', '2008-01-14', 1025, 707);
INSERT INTO Orders
  VALUES (664, '2008-01-11', '2008-01-11', 1015, 707);
INSERT INTO Orders
  VALUES (665, '2008-01-11', '2008-01-11', 1020, 704);
INSERT INTO Orders
  VALUES (666, '2008-01-11', '2008-01-13', 1012, 707);
INSERT INTO Orders
  VALUES (667, '2008-01-11', '2008-01-14', 1009, 708);
INSERT INTO Orders
  VALUES (668, '2008-01-11', '2008-01-14', 1018, 708);
INSERT INTO Orders
  VALUES (669, '2008-01-11', '2008-01-14', 1017, 708);
INSERT INTO Orders
  VALUES (670, '2008-01-12', '2008-01-16', 1021, 701);
INSERT INTO Orders
  VALUES (671, '2008-01-12', '2008-01-12', 1008, 707);
INSERT INTO Orders
  VALUES (672, '2008-01-12', '2008-01-15', 1005, 707);
INSERT INTO Orders
  VALUES (673, '2008-01-12', '2008-01-12', 1026, 708);
INSERT INTO Orders
  VALUES (674, '2008-01-12', '2008-01-12', 1016, 705);
INSERT INTO Orders
  VALUES (675, '2008-01-12', '2008-01-13', 1016, 702);
INSERT INTO Orders
  VALUES (676, '2008-01-12', '2008-01-15', 1002, 701);
INSERT INTO Orders
  VALUES (677, '2008-01-13', '2008-01-16', 1005, 708);
INSERT INTO Orders
  VALUES (678, '2008-01-13', '2008-01-16', 1013, 704);
INSERT INTO Orders
  VALUES (679, '2008-01-13', '2008-01-14', 1026, 707);
INSERT INTO Orders
  VALUES (680, '2008-01-13', '2008-01-16', 1013, 703);
INSERT INTO Orders
  VALUES (681, '2008-01-13', '2008-01-14', 1015, 702);
INSERT INTO Orders
  VALUES (682, '2008-01-13', '2008-01-15', 1018, 704);
INSERT INTO Orders
  VALUES (683, '2008-01-13', '2008-01-13', 1018, 702);
INSERT INTO Orders
  VALUES (684, '2008-01-14', '2008-01-17', 1027, 708);
INSERT INTO Orders
  VALUES (685, '2008-01-14', '2008-01-15', 1005, 704);
INSERT INTO Orders
  VALUES (686, '2008-01-14', '2008-01-18', 1026, 701);
INSERT INTO Orders
  VALUES (687, '2008-01-14', '2008-01-16', 1021, 705);
INSERT INTO Orders
  VALUES (688, '2008-01-14', '2008-01-18', 1002, 702);
INSERT INTO Orders
  VALUES (689, '2008-01-14', '2008-01-15', 1015, 705);
INSERT INTO Orders
  VALUES (690, '2008-01-14', '2008-01-14', 1016, 702);
INSERT INTO Orders
  VALUES (691, '2008-01-14', '2008-01-18', 1004, 707);
INSERT INTO Orders
  VALUES (692, '2008-01-15', '2008-01-18', 1019, 701);
INSERT INTO Orders
  VALUES (693, '2008-01-15', '2008-01-18', 1002, 705);
INSERT INTO Orders
  VALUES (694, '2008-01-15', '2008-01-16', 1019, 708);
INSERT INTO Orders
  VALUES (695, '2008-01-15', '2008-01-17', 1010, 708);
INSERT INTO Orders
  VALUES (696, '2008-01-15', '2008-01-16', 1002, 708);
INSERT INTO Orders
  VALUES (697, '2008-01-15', '2008-01-15', 1005, 704);
INSERT INTO Orders
  VALUES (698, '2008-01-16', '2008-01-17', 1022, 705);
INSERT INTO Orders
  VALUES (699, '2008-01-17', '2008-01-18', 1013, 701);
INSERT INTO Orders
  VALUES (700, '2008-01-17', '2008-01-17', 1013, 707);
INSERT INTO Orders
  VALUES (701, '2008-01-17', '2008-01-19', 1001, 707);
INSERT INTO Orders
  VALUES (702, '2008-01-17', '2008-01-20', 1020, 704);
INSERT INTO Orders
  VALUES (703, '2008-01-17', '2008-01-19', 1007, 704);
INSERT INTO Orders
  VALUES (704, '2008-01-17', '2008-01-21', 1024, 704);
INSERT INTO Orders
  VALUES (705, '2008-01-17', '2008-01-20', 1015, 706);
INSERT INTO Orders
  VALUES (706, '2008-01-17', '2008-01-17', 1016, 703);
INSERT INTO Orders
  VALUES (707, '2008-01-17', '2008-01-18', 1002, 707);
INSERT INTO Orders
  VALUES (708, '2008-01-18', '2008-01-21', 1009, 708);
INSERT INTO Orders
  VALUES (709, '2008-01-18', '2008-01-18', 1018, 702);
INSERT INTO Orders
  VALUES (710, '2008-01-19', '2008-01-21', 1007, 702);
INSERT INTO Orders
  VALUES (711, '2008-01-19', '2008-01-21', 1019, 704);
INSERT INTO Orders
  VALUES (712, '2008-01-19', '2008-01-22', 1024, 705);
INSERT INTO Orders
  VALUES (713, '2008-01-19', '2008-01-23', 1007, 701);
INSERT INTO Orders
  VALUES (714, '2008-01-19', '2008-01-23', 1019, 707);
INSERT INTO Orders
  VALUES (715, '2008-01-19', '2008-01-23', 1020, 707);
INSERT INTO Orders
  VALUES (716, '2008-01-20', '2008-01-24', 1016, 701);
INSERT INTO Orders
  VALUES (717, '2008-01-20', '2008-01-20', 1008, 701);
INSERT INTO Orders
  VALUES (718, '2008-01-20', '2008-01-21', 1010, 705);
INSERT INTO Orders
  VALUES (719, '2008-01-20', '2008-01-23', 1027, 703);
INSERT INTO Orders
  VALUES (720, '2008-01-21', '2008-01-25', 1010, 707);
INSERT INTO Orders
  VALUES (721, '2008-01-21', '2008-01-22', 1015, 705);
INSERT INTO Orders
  VALUES (722, '2008-01-21', '2008-01-22', 1006, 703);
INSERT INTO Orders
  VALUES (723, '2008-01-21', '2008-01-24', 1001, 707);
INSERT INTO Orders
  VALUES (724, '2008-01-22', '2008-01-22', 1017, 704);
INSERT INTO Orders
  VALUES (725, '2008-01-22', '2008-01-24', 1009, 702);
INSERT INTO Orders
  VALUES (726, '2008-01-22', '2008-01-26', 1015, 703);
INSERT INTO Orders
  VALUES (727, '2008-01-22', '2008-01-23', 1017, 706);
INSERT INTO Orders
  VALUES (728, '2008-01-22', '2008-01-24', 1008, 706);
INSERT INTO Orders
  VALUES (729, '2008-01-22', '2008-01-24', 1021, 704);
INSERT INTO Orders
  VALUES (730, '2008-01-22', '2008-01-24', 1023, 706);
INSERT INTO Orders
  VALUES (731, '2008-01-22', '2008-01-26', 1014, 702);
INSERT INTO Orders
  VALUES (732, '2008-01-23', '2008-01-25', 1001, 707);
INSERT INTO Orders
  VALUES (733, '2008-01-23', '2008-01-24', 1011, 706);
INSERT INTO Orders
  VALUES (734, '2008-01-24', '2008-01-26', 1016, 706);
INSERT INTO Orders
  VALUES (735, '2008-01-24', '2008-01-24', 1027, 708);
INSERT INTO Orders
  VALUES (736, '2008-01-24', '2008-01-28', 1003, 708);
INSERT INTO Orders
  VALUES (737, '2008-01-24', '2008-01-27', 1020, 708);
INSERT INTO Orders
  VALUES (738, '2008-01-24', '2008-01-26', 1017, 704);
INSERT INTO Orders
  VALUES (739, '2008-01-24', '2008-01-25', 1022, 703);
INSERT INTO Orders
  VALUES (740, '2008-01-25', '2008-01-26', 1011, 708);
INSERT INTO Orders
  VALUES (741, '2008-01-25', '2008-01-25', 1024, 707);
INSERT INTO Orders
  VALUES (742, '2008-01-25', '2008-01-28', 1013, 706);
INSERT INTO Orders
  VALUES (743, '2008-01-25', '2008-01-27', 1008, 708);
INSERT INTO Orders
  VALUES (744, '2008-01-25', '2008-01-28', 1027, 703);
INSERT INTO Orders
  VALUES (745, '2008-01-25', '2008-01-29', 1027, 706);
INSERT INTO Orders
  VALUES (746, '2008-01-25', '2008-01-29', 1013, 702);
INSERT INTO Orders
  VALUES (747, '2008-01-25', '2008-01-28', 1016, 703);
INSERT INTO Orders
  VALUES (748, '2008-01-25', '2008-01-28', 1021, 703);
INSERT INTO Orders
  VALUES (749, '2008-01-25', '2008-01-29', 1021, 702);
INSERT INTO Orders
  VALUES (750, '2008-01-26', '2008-01-30', 1018, 708);
INSERT INTO Orders
  VALUES (751, '2008-01-26', '2008-01-30', 1025, 707);
INSERT INTO Orders
  VALUES (752, '2008-01-27', '2008-01-31', 1005, 702);
INSERT INTO Orders
  VALUES (753, '2008-01-27', '2008-01-29', 1013, 701);
INSERT INTO Orders
  VALUES (754, '2008-01-27', '2008-01-31', 1014, 708);
INSERT INTO Orders
  VALUES (755, '2008-01-28', '2008-01-31', 1010, 708);
INSERT INTO Orders
  VALUES (756, '2008-01-28', '2008-01-28', 1005, 706);
INSERT INTO Orders
  VALUES (757, '2008-01-28', '2008-01-30', 1014, 702);
INSERT INTO Orders
  VALUES (758, '2008-01-28', '2008-01-30', 1020, 708);
INSERT INTO Orders
  VALUES (759, '2008-01-28', '2008-01-28', 1016, 703);
INSERT INTO Orders
  VALUES (760, '2008-01-28', '2008-01-31', 1014, 707);
INSERT INTO Orders
  VALUES (761, '2008-01-29', '2008-01-30', 1016, 708);
INSERT INTO Orders
  VALUES (762, '2008-01-29', '2008-02-02', 1013, 705);
INSERT INTO Orders
  VALUES (763, '2008-01-29', '2008-02-01', 1009, 701);
INSERT INTO Orders
  VALUES (764, '2008-01-29', '2008-01-29', 1003, 702);
INSERT INTO Orders
  VALUES (765, '2008-01-29', '2008-01-31', 1016, 703);
INSERT INTO Orders
  VALUES (766, '2008-01-29', '2008-01-30', 1026, 707);
INSERT INTO Orders
  VALUES (767, '2008-01-30', '2008-01-31', 1017, 706);
INSERT INTO Orders
  VALUES (768, '2008-01-30', '2008-02-03', 1003, 706);
INSERT INTO Orders
  VALUES (769, '2008-01-30', '2008-02-01', 1020, 705);
INSERT INTO Orders
  VALUES (770, '2008-01-30', '2008-01-30', 1019, 702);
INSERT INTO Orders
  VALUES (771, '2008-01-30', '2008-02-01', 1017, 707);
INSERT INTO Orders
  VALUES (772, '2008-01-30', '2008-01-31', 1024, 704);
INSERT INTO Orders
  VALUES (773, '2008-01-30', '2008-02-02', 1019, 705);
INSERT INTO Orders
  VALUES (774, '2008-01-31', '2008-02-02', 1013, 704);
INSERT INTO Orders
  VALUES (775, '2008-01-31', '2008-01-31', 1010, 704);
INSERT INTO Orders
  VALUES (776, '2008-01-31', '2008-01-31', 1006, 708);
INSERT INTO Orders
  VALUES (777, '2008-01-31', '2008-02-02', 1026, 708);
INSERT INTO Orders
  VALUES (778, '2008-01-31', '2008-01-31', 1025, 707);
INSERT INTO Orders
  VALUES (779, '2008-01-31', '2008-01-31', 1004, 705);
INSERT INTO Orders
  VALUES (780, '2008-01-31', '2008-01-31', 1003, 701);
INSERT INTO Orders
  VALUES (781, '2008-01-31', '2008-02-04', 1021, 704);
INSERT INTO Orders
  VALUES (782, '2008-01-31', '2008-02-03', 1016, 702);
INSERT INTO Orders
  VALUES (783, '2008-01-31', '2008-02-04', 1013, 704);
INSERT INTO Orders
  VALUES (784, '2008-02-01', '2008-02-04', 1018, 707);
INSERT INTO Orders
  VALUES (785, '2008-02-01', '2008-02-05', 1027, 706);
INSERT INTO Orders
  VALUES (786, '2008-02-01', '2008-02-01', 1015, 704);
INSERT INTO Orders
  VALUES (787, '2008-02-01', '2008-02-03', 1009, 707);
INSERT INTO Orders
  VALUES (788, '2008-02-01', '2008-02-01', 1026, 704);
INSERT INTO Orders
  VALUES (789, '2008-02-01', '2008-02-05', 1021, 707);
INSERT INTO Orders
  VALUES (790, '2008-02-01', '2008-02-01', 1004, 707);
INSERT INTO Orders
  VALUES (791, '2008-02-01', '2008-02-02', 1017, 706);
INSERT INTO Orders
  VALUES (792, '2008-02-02', '2008-02-05', 1027, 707);
INSERT INTO Orders
  VALUES (793, '2008-02-02', '2008-02-03', 1026, 706);
INSERT INTO Orders
  VALUES (794, '2008-02-02', '2008-02-04', 1016, 703);
INSERT INTO Orders
  VALUES (795, '2008-02-03', '2008-02-05', 1024, 707);
INSERT INTO Orders
  VALUES (796, '2008-02-03', '2008-02-07', 1007, 703);
INSERT INTO Orders
  VALUES (797, '2008-02-03', '2008-02-06', 1018, 705);
INSERT INTO Orders
  VALUES (798, '2008-02-03', '2008-02-04', 1003, 702);
INSERT INTO Orders
  VALUES (799, '2008-02-04', '2008-02-05', 1010, 704);
INSERT INTO Orders
  VALUES (800, '2008-02-04', '2008-02-07', 1027, 707);
INSERT INTO Orders
  VALUES (801, '2008-02-04', '2008-02-08', 1002, 707);
INSERT INTO Orders
  VALUES (802, '2008-02-04', '2008-02-04', 1021, 707);
INSERT INTO Orders
  VALUES (803, '2008-02-05', '2008-02-08', 1004, 704);
INSERT INTO Orders
  VALUES (804, '2008-02-05', '2008-02-05', 1014, 708);
INSERT INTO Orders
  VALUES (805, '2008-02-05', '2008-02-05', 1009, 702);
INSERT INTO Orders
  VALUES (806, '2008-02-05', '2008-02-07', 1019, 707);
INSERT INTO Orders
  VALUES (807, '2008-02-06', '2008-02-07', 1016, 705);
INSERT INTO Orders
  VALUES (808, '2008-02-06', '2008-02-07', 1004, 704);
INSERT INTO Orders
  VALUES (809, '2008-02-07', '2008-02-11', 1004, 701);
INSERT INTO Orders
  VALUES (810, '2008-02-07', '2008-02-07', 1022, 705);
INSERT INTO Orders
  VALUES (811, '2008-02-07', '2008-02-11', 1008, 707);
INSERT INTO Orders
  VALUES (812, '2008-02-07', '2008-02-07', 1005, 707);
INSERT INTO Orders
  VALUES (813, '2008-02-08', '2008-02-08', 1013, 705);
INSERT INTO Orders
  VALUES (814, '2008-02-08', '2008-02-08', 1013, 706);
INSERT INTO Orders
  VALUES (815, '2008-02-08', '2008-02-12', 1007, 702);
INSERT INTO Orders
  VALUES (816, '2008-02-08', '2008-02-11', 1011, 701);
INSERT INTO Orders
  VALUES (817, '2008-02-08', '2008-02-08', 1001, 705);
INSERT INTO Orders
  VALUES (818, '2008-02-08', '2008-02-10', 1023, 704);
INSERT INTO Orders
  VALUES (819, '2008-02-08', '2008-02-12', 1013, 707);
INSERT INTO Orders
  VALUES (820, '2008-02-08', '2008-02-09', 1019, 704);
INSERT INTO Orders
  VALUES (821, '2008-02-08', '2008-02-12', 1023, 708);
INSERT INTO Orders
  VALUES (822, '2008-02-08', '2008-02-09', 1004, 701);
INSERT INTO Orders
  VALUES (823, '2008-02-09', '2008-02-10', 1003, 703);
INSERT INTO Orders
  VALUES (824, '2008-02-09', '2008-02-10', 1006, 701);
INSERT INTO Orders
  VALUES (825, '2008-02-09', '2008-02-09', 1025, 708);
INSERT INTO Orders
  VALUES (826, '2008-02-09', '2008-02-09', 1005, 707);
INSERT INTO Orders
  VALUES (827, '2008-02-10', '2008-02-14', 1013, 706);
INSERT INTO Orders
  VALUES (828, '2008-02-10', '2008-02-10', 1014, 701);
INSERT INTO Orders
  VALUES (829, '2008-02-10', '2008-02-11', 1027, 701);
INSERT INTO Orders
  VALUES (830, '2008-02-11', '2008-02-13', 1020, 703);
INSERT INTO Orders
  VALUES (831, '2008-02-11', '2008-02-14', 1012, 705);
INSERT INTO Orders
  VALUES (832, '2008-02-11', '2008-02-15', 1012, 707);
INSERT INTO Orders
  VALUES (833, '2008-02-11', '2008-02-15', 1007, 706);
INSERT INTO Orders
  VALUES (834, '2008-02-11', '2008-02-11', 1021, 704);
INSERT INTO Orders
  VALUES (835, '2008-02-11', '2008-02-13', 1012, 703);
INSERT INTO Orders
  VALUES (836, '2008-02-11', '2008-02-14', 1007, 708);
INSERT INTO Orders
  VALUES (837, '2008-02-11', '2008-02-13', 1012, 701);
INSERT INTO Orders
  VALUES (838, '2008-02-11', '2008-02-13', 1014, 706);
INSERT INTO Orders
  VALUES (839, '2008-02-12', '2008-02-12', 1012, 702);
INSERT INTO Orders
  VALUES (840, '2008-02-12', '2008-02-12', 1001, 701);
INSERT INTO Orders
  VALUES (841, '2008-02-12', '2008-02-16', 1017, 707);
INSERT INTO Orders
  VALUES (842, '2008-02-12', '2008-02-14', 1013, 707);
INSERT INTO Orders
  VALUES (843, '2008-02-12', '2008-02-14', 1008, 705);
INSERT INTO Orders
  VALUES (844, '2008-02-12', '2008-02-14', 1014, 708);
INSERT INTO Orders
  VALUES (845, '2008-02-12', '2008-02-15', 1020, 701);
INSERT INTO Orders
  VALUES (846, '2008-02-13', '2008-02-17', 1012, 704);
INSERT INTO Orders
  VALUES (847, '2008-02-13', '2008-02-15', 1027, 706);
INSERT INTO Orders
  VALUES (848, '2008-02-13', '2008-02-16', 1014, 706);
INSERT INTO Orders
  VALUES (849, '2008-02-13', '2008-02-15', 1026, 708);
INSERT INTO Orders
  VALUES (850, '2008-02-13', '2008-02-13', 1003, 701);
INSERT INTO Orders
  VALUES (851, '2008-02-13', '2008-02-13', 1001, 702);
INSERT INTO Orders
  VALUES (852, '2008-02-13', '2008-02-16', 1002, 707);
INSERT INTO Orders
  VALUES (853, '2008-02-13', '2008-02-16', 1023, 708);
INSERT INTO Orders
  VALUES (854, '2008-02-13', '2008-02-16', 1004, 706);
INSERT INTO Orders
  VALUES (855, '2008-02-14', '2008-02-15', 1001, 704);
INSERT INTO Orders
  VALUES (856, '2008-02-14', '2008-02-14', 1026, 703);
INSERT INTO Orders
  VALUES (857, '2008-02-14', '2008-02-14', 1017, 708);
INSERT INTO Orders
  VALUES (858, '2008-02-15', '2008-02-19', 1023, 701);
INSERT INTO Orders
  VALUES (859, '2008-02-16', '2008-02-16', 1016, 703);
INSERT INTO Orders
  VALUES (860, '2008-02-16', '2008-02-19', 1003, 703);
INSERT INTO Orders
  VALUES (861, '2008-02-16', '2008-02-16', 1026, 708);
INSERT INTO Orders
  VALUES (862, '2008-02-16', '2008-02-20', 1010, 702);
INSERT INTO Orders
  VALUES (863, '2008-02-16', '2008-02-17', 1025, 704);
INSERT INTO Orders
  VALUES (864, '2008-02-16', '2008-02-16', 1008, 707);
INSERT INTO Orders
  VALUES (865, '2008-02-16', '2008-02-20', 1024, 703);
INSERT INTO Orders
  VALUES (866, '2008-02-16', '2008-02-17', 1022, 706);
INSERT INTO Orders
  VALUES (867, '2008-02-16', '2008-02-20', 1017, 708);
INSERT INTO Orders
  VALUES (868, '2008-02-16', '2008-02-18', 1021, 702);
INSERT INTO Orders
  VALUES (869, '2008-02-17', '2008-02-19', 1024, 708);
INSERT INTO Orders
  VALUES (870, '2008-02-17', '2008-02-20', 1005, 704);
INSERT INTO Orders
  VALUES (871, '2008-02-17', '2008-02-19', 1021, 708);
INSERT INTO Orders
  VALUES (872, '2008-02-17', '2008-02-21', 1017, 702);
INSERT INTO Orders
  VALUES (873, '2008-02-17', '2008-02-18', 1020, 702);
INSERT INTO Orders
  VALUES (874, '2008-02-18', '2008-02-21', 1005, 702);
INSERT INTO Orders
  VALUES (875, '2008-02-18', '2008-02-22', 1017, 702);
INSERT INTO Orders
  VALUES (876, '2008-02-18', '2008-02-18', 1005, 708);
INSERT INTO Orders
  VALUES (877, '2008-02-18', '2008-02-18', 1017, 708);
INSERT INTO Orders
  VALUES (878, '2008-02-18', '2008-02-21', 1008, 706);
INSERT INTO Orders
  VALUES (879, '2008-02-18', '2008-02-19', 1013, 705);
INSERT INTO Orders
  VALUES (880, '2008-02-18', '2008-02-22', 1006, 704);
INSERT INTO Orders
  VALUES (881, '2008-02-18', '2008-02-20', 1016, 707);
INSERT INTO Orders
  VALUES (882, '2008-02-18', '2008-02-22', 1008, 707);
INSERT INTO Orders
  VALUES (883, '2008-02-19', '2008-02-22', 1011, 704);
INSERT INTO Orders
  VALUES (884, '2008-02-19', '2008-02-22', 1027, 704);
INSERT INTO Orders
  VALUES (885, '2008-02-20', '2008-02-23', 1009, 701);
INSERT INTO Orders
  VALUES (886, '2008-02-20', '2008-02-21', 1027, 708);
INSERT INTO Orders
  VALUES (887, '2008-02-20', '2008-02-23', 1001, 705);
INSERT INTO Orders
  VALUES (888, '2008-02-20', '2008-02-23', 1007, 707);
INSERT INTO Orders
  VALUES (889, '2008-02-20', '2008-02-24', 1023, 702);
INSERT INTO Orders
  VALUES (890, '2008-02-20', '2008-02-24', 1022, 705);
INSERT INTO Orders
  VALUES (891, '2008-02-20', '2008-02-21', 1006, 706);
INSERT INTO Orders
  VALUES (892, '2008-02-21', '2008-02-22', 1010, 703);
INSERT INTO Orders
  VALUES (893, '2008-02-21', '2008-02-25', 1022, 705);
INSERT INTO Orders
  VALUES (894, '2008-02-21', '2008-02-23', 1024, 704);
INSERT INTO Orders
  VALUES (895, '2008-02-21', '2008-02-21', 1011, 705);
INSERT INTO Orders
  VALUES (896, '2008-02-21', '2008-02-24', 1025, 702);
INSERT INTO Orders
  VALUES (897, '2008-02-21', '2008-02-24', 1027, 701);
INSERT INTO Orders
  VALUES (898, '2008-02-21', '2008-02-24', 1001, 708);
INSERT INTO Orders
  VALUES (899, '2008-02-21', '2008-02-25', 1009, 705);
INSERT INTO Orders
  VALUES (900, '2008-02-22', '2008-02-24', 1020, 701);
INSERT INTO Orders
  VALUES (901, '2008-02-22', '2008-02-24', 1013, 707);
INSERT INTO Orders
  VALUES (902, '2008-02-22', '2008-02-23', 1006, 702);
INSERT INTO Orders
  VALUES (903, '2008-02-22', '2008-02-23', 1021, 707);
INSERT INTO Orders
  VALUES (904, '2008-02-22', '2008-02-26', 1009, 708);
INSERT INTO Orders
  VALUES (905, '2008-02-22', '2008-02-24', 1024, 704);
INSERT INTO Orders
  VALUES (906, '2008-02-22', '2008-02-22', 1012, 707);
INSERT INTO Orders
  VALUES (907, '2008-02-23', '2008-02-23', 1014, 702);
INSERT INTO Orders
  VALUES (908, '2008-02-23', '2008-02-24', 1025, 705);
INSERT INTO Orders
  VALUES (909, '2008-02-24', '2008-02-24', 1024, 705);
INSERT INTO Orders
  VALUES (910, '2008-02-24', '2008-02-27', 1019, 702);
INSERT INTO Orders
  VALUES (911, '2008-02-24', '2008-02-26', 1023, 702);
INSERT INTO Orders
  VALUES (912, '2008-02-24', '2008-02-28', 1025, 706);
INSERT INTO Orders
  VALUES (913, '2008-02-24', '2008-02-25', 1025, 707);
INSERT INTO Orders
  VALUES (914, '2008-02-24', '2008-02-24', 1022, 707);
INSERT INTO Orders
  VALUES (915, '2008-02-24', '2008-02-25', 1016, 705);
INSERT INTO Orders
  VALUES (916, '2008-02-24', '2008-02-24', 1025, 705);
INSERT INTO Orders
  VALUES (917, '2008-02-24', '2008-02-26', 1013, 703);
INSERT INTO Orders
  VALUES (918, '2008-02-25', '2008-02-28', 1025, 703);
INSERT INTO Orders
  VALUES (919, '2008-02-25', '2008-02-27', 1014, 707);
INSERT INTO Orders
  VALUES (920, '2008-02-26', '2008-02-29', 1008, 708);
INSERT INTO Orders
  VALUES (921, '2008-02-26', '2008-02-26', 1018, 702);
INSERT INTO Orders
  VALUES (922, '2008-02-26', '2008-02-27', 1004, 706);
INSERT INTO Orders
  VALUES (923, '2008-02-26', '2008-02-29', 1009, 707);
INSERT INTO Orders
  VALUES (924, '2008-02-26', '2008-02-29', 1002, 704);
INSERT INTO Orders
  VALUES (925, '2008-02-26', '2008-02-26', 1025, 702);
INSERT INTO Orders
  VALUES (926, '2008-02-26', '2008-02-27', 1005, 701);
INSERT INTO Orders
  VALUES (927, '2008-02-27', '2008-02-28', 1007, 704);
INSERT INTO Orders
  VALUES (928, '2008-02-27', '2008-03-01', 1017, 706);
INSERT INTO Orders
  VALUES (929, '2008-02-27', '2008-02-27', 1020, 705);
INSERT INTO Orders
  VALUES (930, '2008-02-27', '2008-02-29', 1023, 701);
INSERT INTO Orders
  VALUES (931, '2008-02-27', '2008-02-27', 1001, 707);
INSERT INTO Orders
  VALUES (932, '2008-02-27', '2008-02-27', 1012, 704);
INSERT INTO Orders
  VALUES (933, '2008-02-27', '2008-02-27', 1026, 705);
INSERT INTO Orders
  VALUES (934, '2008-02-27', '2008-02-28', 1021, 705);
INSERT INTO Orders
  VALUES (935, '2008-02-27', '2008-03-01', 1020, 702);
INSERT INTO Orders
  VALUES (936, '2008-02-28', '2008-02-29', 1025, 704);
INSERT INTO Orders
  VALUES (937, '2008-02-28', '2008-03-03', 1014, 706);
INSERT INTO Orders
  VALUES (938, '2008-02-28', '2008-02-28', 1011, 705);
INSERT INTO Orders
  VALUES (939, '2008-02-28', '2008-02-28', 1021, 701);
INSERT INTO Orders
  VALUES (940, '2008-02-28', '2008-03-03', 1007, 702);
INSERT INTO Orders
  VALUES (941, '2008-02-28', '2008-02-28', 1019, 702);
INSERT INTO Orders
  VALUES (942, '2008-02-28', '2008-02-29', 1002, 706);
INSERT INTO Orders
  VALUES (943, '2008-02-28', '2008-02-29', 1026, 707);
INSERT INTO Orders
  VALUES (944, '2008-02-28', '2008-03-02', 1020, 702);
INSERT INTO Order_Details
  VALUES (1, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (1, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (1, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (1, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (1, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (1, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (1, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (2, 27, 24, 4);
INSERT INTO Order_Details
  VALUES (2, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (3, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (3, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (3, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (3, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (3, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (3, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (3, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (3, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (4, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (4, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (4, 17, 45, 1);
INSERT INTO Order_Details
  VALUES (4, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (4, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (5, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (5, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (5, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (6, 2, 1746, 5);
INSERT INTO Order_Details
  VALUES (6, 7, 49, 2);
INSERT INTO Order_Details
  VALUES (6, 12, 22.8, 6);
INSERT INTO Order_Details
  VALUES (6, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (6, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (6, 27, 24, 4);
INSERT INTO Order_Details
  VALUES (6, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (7, 14, 139.95, 3);
INSERT INTO Order_Details
  VALUES (7, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (8, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (8, 22, 82, 3);
INSERT INTO Order_Details
  VALUES (8, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (8, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (8, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (9, 24, 69, 1);
INSERT INTO Order_Details
  VALUES (10, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (10, 24, 69, 3);
INSERT INTO Order_Details
  VALUES (11, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (11, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (11, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (11, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (11, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (11, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (11, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (11, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (12, 10, 36, 2);
INSERT INTO Order_Details
  VALUES (13, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (13, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (13, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (13, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (14, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (14, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (14, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (15, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (15, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (15, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (15, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (15, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (16, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (16, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (16, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (16, 24, 69, 4);
INSERT INTO Order_Details
  VALUES (16, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (16, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (16, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (17, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (17, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (17, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (17, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (17, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (17, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (18, 12, 22.8, 6);
INSERT INTO Order_Details
  VALUES (18, 20, 15, 4);
INSERT INTO Order_Details
  VALUES (18, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (18, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (19, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (19, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (19, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (19, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (19, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (19, 30, 45, 4);
INSERT INTO Order_Details
  VALUES (19, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (19, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (20, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (20, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (21, 3, 75, 3);
INSERT INTO Order_Details
  VALUES (21, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (21, 33, 18.43, 5);
INSERT INTO Order_Details
  VALUES (22, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (22, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (22, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (22, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (22, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (23, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (23, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (23, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (23, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (23, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (23, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (23, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (23, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (24, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (24, 14, 139.95, 3);
INSERT INTO Order_Details
  VALUES (24, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (24, 24, 69, 1);
INSERT INTO Order_Details
  VALUES (24, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (24, 34, 27, 2);
INSERT INTO Order_Details
  VALUES (25, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (25, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (25, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (25, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (25, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (26, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (26, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (26, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (26, 24, 69, 1);
INSERT INTO Order_Details
  VALUES (26, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (26, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (27, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (27, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (27, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (27, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (27, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (27, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (28, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (28, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (29, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (30, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (30, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (30, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (30, 29, 34, 4);
INSERT INTO Order_Details
  VALUES (30, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (31, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (32, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (32, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (32, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (32, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (32, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (32, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (33, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (33, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (33, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (33, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (33, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (33, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (34, 8, 48.5, 5);
INSERT INTO Order_Details
  VALUES (34, 28, 28.13, 6);
INSERT INTO Order_Details
  VALUES (35, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (35, 14, 139.95, 1);
INSERT INTO Order_Details
  VALUES (35, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (36, 5, 7.45, 1);
INSERT INTO Order_Details
  VALUES (37, 8, 50, 3);
INSERT INTO Order_Details
  VALUES (37, 18, 173.63, 6);
INSERT INTO Order_Details
  VALUES (37, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (37, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (38, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (39, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (39, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (39, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (39, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (39, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (39, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (39, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (39, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (40, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (40, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (40, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (41, 10, 36, 4);
INSERT INTO Order_Details
  VALUES (41, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (41, 22, 79.54, 5);
INSERT INTO Order_Details
  VALUES (41, 28, 28.13, 6);
INSERT INTO Order_Details
  VALUES (41, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (41, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (42, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (42, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (42, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (42, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (42, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (43, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (43, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (43, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (43, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (43, 28, 28.13, 6);
INSERT INTO Order_Details
  VALUES (43, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (43, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (44, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (44, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (44, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (44, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (44, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (44, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (45, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (45, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (45, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (45, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (45, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (45, 30, 43.65, 5);
INSERT INTO Order_Details
  VALUES (45, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (45, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (46, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (47, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (48, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (48, 20, 14.55, 6);
INSERT INTO Order_Details
  VALUES (48, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (49, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (49, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (49, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (49, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (49, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (50, 5, 7.45, 2);
INSERT INTO Order_Details
  VALUES (50, 15, 4.84, 6);
INSERT INTO Order_Details
  VALUES (50, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (50, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (51, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (52, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (53, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (53, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (53, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (53, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (53, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (53, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (53, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (54, 10, 36, 2);
INSERT INTO Order_Details
  VALUES (55, 10, 36, 1);
INSERT INTO Order_Details
  VALUES (56, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (56, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (56, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (56, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (57, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (57, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (57, 20, 14.55, 5);
INSERT INTO Order_Details
  VALUES (57, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (57, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (57, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (58, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (58, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (58, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (58, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (58, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (58, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (59, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (59, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (59, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (59, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (59, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (59, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (59, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (60, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (60, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (60, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (60, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (60, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (60, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (60, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (61, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (61, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (61, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (61, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (61, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (62, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (62, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (62, 27, 24, 4);
INSERT INTO Order_Details
  VALUES (62, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (62, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (63, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (63, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (64, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (64, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (64, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (64, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (64, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (64, 28, 29, 3);
INSERT INTO Order_Details
  VALUES (64, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (64, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (65, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (65, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (65, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (65, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (66, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (66, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (66, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (66, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (66, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (66, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (66, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (66, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (67, 10, 36, 4);
INSERT INTO Order_Details
  VALUES (67, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (67, 22, 82, 4);
INSERT INTO Order_Details
  VALUES (67, 28, 29, 3);
INSERT INTO Order_Details
  VALUES (67, 34, 27, 2);
INSERT INTO Order_Details
  VALUES (67, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (68, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (69, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (69, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (69, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (69, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (70, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (70, 22, 82, 3);
INSERT INTO Order_Details
  VALUES (70, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (71, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (71, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (71, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (72, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (72, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (72, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (72, 32, 32, 4);
INSERT INTO Order_Details
  VALUES (72, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (73, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (73, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (73, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (73, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (73, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (73, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (74, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (74, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (74, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (74, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (74, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (74, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (74, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (74, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (75, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (75, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (75, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (75, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (75, 24, 69, 4);
INSERT INTO Order_Details
  VALUES (75, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (75, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (75, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (76, 18, 173.63, 5);
INSERT INTO Order_Details
  VALUES (77, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (77, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (77, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (77, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (77, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (77, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (78, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (78, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (78, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (78, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (79, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (79, 7, 49, 2);
INSERT INTO Order_Details
  VALUES (79, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (79, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (79, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (79, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (80, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (80, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (80, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (80, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (80, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (80, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (80, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (81, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (82, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (82, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (82, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (82, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (82, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (82, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (82, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (83, 10, 36, 4);
INSERT INTO Order_Details
  VALUES (83, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (84, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (84, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (84, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (84, 40, 174.6, 5);
INSERT INTO Order_Details
  VALUES (85, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (85, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (85, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (85, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (85, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (86, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (86, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (86, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (86, 18, 179, 3);
INSERT INTO Order_Details
  VALUES (86, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (86, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (86, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (87, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (87, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (87, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (88, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (89, 15, 4.84, 6);
INSERT INTO Order_Details
  VALUES (89, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (89, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (90, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (91, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (91, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (91, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (91, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (91, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (91, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (91, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (92, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (92, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (92, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (93, 3, 75, 1);
INSERT INTO Order_Details
  VALUES (94, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (94, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (94, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (94, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (94, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (94, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (95, 5, 7.23, 5);
INSERT INTO Order_Details
  VALUES (95, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (95, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (95, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (95, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (96, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (96, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (96, 27, 24, 3);
INSERT INTO Order_Details
  VALUES (96, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (97, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (97, 14, 139.95, 1);
INSERT INTO Order_Details
  VALUES (97, 30, 45, 1);
INSERT INTO Order_Details
  VALUES (98, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (98, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (99, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (99, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (100, 3, 75, 3);
INSERT INTO Order_Details
  VALUES (100, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (100, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (100, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (100, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (101, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (101, 15, 4.99, 4);
INSERT INTO Order_Details
  VALUES (101, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (101, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (102, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (102, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (102, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (102, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (102, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (103, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (103, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (103, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (103, 24, 69, 3);
INSERT INTO Order_Details
  VALUES (103, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (103, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (103, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (104, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (104, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (105, 2, 1746, 5);
INSERT INTO Order_Details
  VALUES (105, 8, 50, 3);
INSERT INTO Order_Details
  VALUES (105, 14, 139.95, 1);
INSERT INTO Order_Details
  VALUES (105, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (105, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (105, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (106, 32, 32, 4);
INSERT INTO Order_Details
  VALUES (107, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (107, 22, 82, 3);
INSERT INTO Order_Details
  VALUES (107, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (107, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (107, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (108, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (109, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (110, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (110, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (110, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (110, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (111, 2, 1746, 6);
INSERT INTO Order_Details
  VALUES (111, 8, 50, 4);
INSERT INTO Order_Details
  VALUES (111, 14, 139.95, 3);
INSERT INTO Order_Details
  VALUES (111, 20, 14.55, 6);
INSERT INTO Order_Details
  VALUES (111, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (111, 32, 32, 4);
INSERT INTO Order_Details
  VALUES (112, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (112, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (113, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (113, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (113, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (114, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (114, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (115, 8, 50, 4);
INSERT INTO Order_Details
  VALUES (115, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (115, 24, 69, 3);
INSERT INTO Order_Details
  VALUES (115, 32, 32, 4);
INSERT INTO Order_Details
  VALUES (115, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (116, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (116, 12, 23.5, 2);
INSERT INTO Order_Details
  VALUES (116, 20, 15, 2);
INSERT INTO Order_Details
  VALUES (116, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (116, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (117, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (117, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (117, 18, 179, 4);
INSERT INTO Order_Details
  VALUES (117, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (117, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (117, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (118, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (119, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (119, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (119, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (119, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (119, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (119, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (119, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (120, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (120, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (120, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (120, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (120, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (121, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (121, 14, 139.95, 1);
INSERT INTO Order_Details
  VALUES (121, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (122, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (122, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (122, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (122, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (122, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (123, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (123, 12, 23.5, 2);
INSERT INTO Order_Details
  VALUES (123, 18, 179, 1);
INSERT INTO Order_Details
  VALUES (123, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (123, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (123, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (124, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (124, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (125, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (125, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (125, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (126, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (126, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (126, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (126, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (126, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (126, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (126, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (127, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (127, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (127, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (127, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (127, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (127, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (128, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (128, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (129, 24, 69, 1);
INSERT INTO Order_Details
  VALUES (130, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (130, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (130, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (130, 18, 179, 2);
INSERT INTO Order_Details
  VALUES (130, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (130, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (130, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (131, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (131, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (131, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (132, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (132, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (133, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (134, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (134, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (134, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (134, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (134, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (135, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (135, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (135, 22, 82, 1);
INSERT INTO Order_Details
  VALUES (135, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (135, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (136, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (136, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (136, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (136, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (136, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (137, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (137, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (137, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (137, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (138, 10, 36, 4);
INSERT INTO Order_Details
  VALUES (138, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (138, 22, 79.54, 5);
INSERT INTO Order_Details
  VALUES (138, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (138, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (138, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (139, 32, 32, 4);
INSERT INTO Order_Details
  VALUES (140, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (140, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (140, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (140, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (140, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (140, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (140, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (141, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (141, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (141, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (141, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (141, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (141, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (142, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (142, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (143, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (143, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (144, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (144, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (144, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (145, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (145, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (146, 18, 179, 2);
INSERT INTO Order_Details
  VALUES (147, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (147, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (147, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (148, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (148, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (148, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (148, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (148, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (148, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (148, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (148, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (149, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (149, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (150, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (150, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (150, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (150, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (151, 24, 69, 4);
INSERT INTO Order_Details
  VALUES (152, 2, 1800, 3);
INSERT INTO Order_Details
  VALUES (152, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (152, 12, 23.5, 4);
INSERT INTO Order_Details
  VALUES (152, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (152, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (152, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (152, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (153, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (153, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (153, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (153, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (153, 40, 174.6, 5);
INSERT INTO Order_Details
  VALUES (154, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (154, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (155, 10, 36, 4);
INSERT INTO Order_Details
  VALUES (155, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (155, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (155, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (156, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (156, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (156, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (156, 24, 69, 3);
INSERT INTO Order_Details
  VALUES (156, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (156, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (156, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (157, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (157, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (157, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (157, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (158, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (159, 10, 34.92, 5);
INSERT INTO Order_Details
  VALUES (159, 20, 15, 2);
INSERT INTO Order_Details
  VALUES (159, 30, 45, 4);
INSERT INTO Order_Details
  VALUES (159, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (160, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (160, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (160, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (160, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (160, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (160, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (160, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (160, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (161, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (161, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (161, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (162, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (162, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (163, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (163, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (163, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (163, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (163, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (163, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (164, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (164, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (165, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (165, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (165, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (165, 20, 14.55, 6);
INSERT INTO Order_Details
  VALUES (165, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (165, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (165, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (165, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (166, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (166, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (166, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (166, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (166, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (167, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (167, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (167, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (167, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (167, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (168, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (168, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (168, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (168, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (168, 29, 34, 4);
INSERT INTO Order_Details
  VALUES (168, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (169, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (169, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (169, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (169, 24, 69, 2);
INSERT INTO Order_Details
  VALUES (169, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (169, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (169, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (170, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (170, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (170, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (170, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (170, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (170, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (171, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (172, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (172, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (172, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (172, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (173, 22, 82, 3);
INSERT INTO Order_Details
  VALUES (173, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (174, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (174, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (175, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (175, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (175, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (175, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (175, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (175, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (175, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (175, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (176, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (176, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (176, 27, 24, 3);
INSERT INTO Order_Details
  VALUES (176, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (177, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (177, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (177, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (177, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (177, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (178, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (178, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (178, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (178, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (179, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (179, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (179, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (179, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (179, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (179, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (179, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (179, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (180, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (180, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (181, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (181, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (181, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (181, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (182, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (182, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (182, 18, 179, 4);
INSERT INTO Order_Details
  VALUES (182, 28, 29, 2);
INSERT INTO Order_Details
  VALUES (182, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (182, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (183, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (183, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (183, 12, 22.8, 5);
INSERT INTO Order_Details
  VALUES (183, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (183, 22, 82, 4);
INSERT INTO Order_Details
  VALUES (183, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (183, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (183, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (184, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (184, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (184, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (184, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (184, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (184, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (184, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (184, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (185, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (185, 18, 179, 2);
INSERT INTO Order_Details
  VALUES (185, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (185, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (186, 5, 7.23, 6);
INSERT INTO Order_Details
  VALUES (186, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (187, 22, 79.54, 5);
INSERT INTO Order_Details
  VALUES (187, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (188, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (188, 37, 189, 2);
INSERT INTO Order_Details
  VALUES (189, 5, 7.23, 5);
INSERT INTO Order_Details
  VALUES (189, 15, 4.99, 4);
INSERT INTO Order_Details
  VALUES (189, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (189, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (190, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (191, 8, 48.5, 5);
INSERT INTO Order_Details
  VALUES (191, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (191, 18, 179, 1);
INSERT INTO Order_Details
  VALUES (191, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (191, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (191, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (192, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (192, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (192, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (192, 32, 32, 4);
INSERT INTO Order_Details
  VALUES (192, 37, 189, 2);
INSERT INTO Order_Details
  VALUES (193, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (193, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (193, 20, 15, 4);
INSERT INTO Order_Details
  VALUES (193, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (193, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (193, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (193, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (194, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (194, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (194, 31, 21.34, 6);
INSERT INTO Order_Details
  VALUES (195, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (196, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (196, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (196, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (196, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (196, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (196, 40, 174.6, 5);
INSERT INTO Order_Details
  VALUES (197, 18, 179, 1);
INSERT INTO Order_Details
  VALUES (199, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (199, 15, 4.84, 5);
INSERT INTO Order_Details
  VALUES (199, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (199, 27, 24, 3);
INSERT INTO Order_Details
  VALUES (199, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (199, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (200, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (200, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (200, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (200, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (200, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (200, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (201, 5, 7.23, 6);
INSERT INTO Order_Details
  VALUES (202, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (203, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (203, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (203, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (203, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (203, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (203, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (204, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (205, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (205, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (205, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (205, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (205, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (205, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (205, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (206, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (206, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (206, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (207, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (207, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (208, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (208, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (208, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (208, 24, 69, 1);
INSERT INTO Order_Details
  VALUES (208, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (208, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (208, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (209, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (209, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (210, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (210, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (210, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (210, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (210, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (210, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (210, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (211, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (212, 3, 75, 2);
INSERT INTO Order_Details
  VALUES (213, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (213, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (214, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (214, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (214, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (215, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (215, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (215, 18, 179, 3);
INSERT INTO Order_Details
  VALUES (215, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (215, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (215, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (217, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (217, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (217, 30, 45, 4);
INSERT INTO Order_Details
  VALUES (217, 40, 174.6, 5);
INSERT INTO Order_Details
  VALUES (218, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (218, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (218, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (218, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (218, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (218, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (219, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (219, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (219, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (219, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (219, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (219, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (220, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (220, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (220, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (220, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (220, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (220, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (220, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (221, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (221, 14, 139.95, 3);
INSERT INTO Order_Details
  VALUES (221, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (221, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (221, 38, 161.02, 6);
INSERT INTO Order_Details
  VALUES (222, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (222, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (222, 24, 69, 1);
INSERT INTO Order_Details
  VALUES (222, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (223, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (223, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (223, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (223, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (224, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (224, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (224, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (224, 28, 29, 2);
INSERT INTO Order_Details
  VALUES (224, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (225, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (225, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (225, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (225, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (225, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (225, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (226, 20, 15, 4);
INSERT INTO Order_Details
  VALUES (226, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (226, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (227, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (227, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (227, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (227, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (227, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (227, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (227, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (227, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (228, 17, 45, 1);
INSERT INTO Order_Details
  VALUES (229, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (229, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (230, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (231, 8, 50, 4);
INSERT INTO Order_Details
  VALUES (231, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (231, 18, 179, 2);
INSERT INTO Order_Details
  VALUES (231, 28, 28.13, 6);
INSERT INTO Order_Details
  VALUES (231, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (231, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (232, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (232, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (232, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (232, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (232, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (232, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (233, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (233, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (234, 10, 36, 2);
INSERT INTO Order_Details
  VALUES (234, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (235, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (235, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (235, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (235, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (236, 5, 7.45, 4);
INSERT INTO Order_Details
  VALUES (236, 10, 34.92, 6);
INSERT INTO Order_Details
  VALUES (236, 15, 4.99, 4);
INSERT INTO Order_Details
  VALUES (236, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (236, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (236, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (236, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (236, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (237, 2, 1800, 2);
INSERT INTO Order_Details
  VALUES (237, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (237, 12, 22.8, 6);
INSERT INTO Order_Details
  VALUES (237, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (237, 22, 82, 4);
INSERT INTO Order_Details
  VALUES (237, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (237, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (238, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (238, 24, 69, 2);
INSERT INTO Order_Details
  VALUES (238, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (239, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (239, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (239, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (239, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (239, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (239, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (239, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (240, 5, 7.23, 6);
INSERT INTO Order_Details
  VALUES (240, 18, 173.63, 6);
INSERT INTO Order_Details
  VALUES (240, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (241, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (241, 27, 24, 4);
INSERT INTO Order_Details
  VALUES (241, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (242, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (242, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (242, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (242, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (242, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (242, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (242, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (242, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (243, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (243, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (243, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (243, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (243, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (243, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (243, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (244, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (245, 10, 34.92, 6);
INSERT INTO Order_Details
  VALUES (245, 18, 179, 4);
INSERT INTO Order_Details
  VALUES (245, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (245, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (246, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (246, 15, 4.99, 1);
INSERT INTO Order_Details
  VALUES (246, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (246, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (246, 33, 18.43, 5);
INSERT INTO Order_Details
  VALUES (246, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (247, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (247, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (247, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (247, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (247, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (248, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (248, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (248, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (248, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (248, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (248, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (249, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (249, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (249, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (249, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (249, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (249, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (250, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (250, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (250, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (251, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (251, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (251, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (251, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (251, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (251, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (251, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (252, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (252, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (252, 14, 139.95, 1);
INSERT INTO Order_Details
  VALUES (252, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (252, 24, 69, 3);
INSERT INTO Order_Details
  VALUES (252, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (252, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (252, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (253, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (253, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (254, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (254, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (254, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (255, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (256, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (256, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (256, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (256, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (256, 24, 69, 2);
INSERT INTO Order_Details
  VALUES (256, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (256, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (256, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (257, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (257, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (257, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (257, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (257, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (257, 37, 189, 2);
INSERT INTO Order_Details
  VALUES (258, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (258, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (258, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (258, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (258, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (258, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (258, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (258, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (259, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (260, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (260, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (260, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (260, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (260, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (261, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (261, 15, 4.99, 1);
INSERT INTO Order_Details
  VALUES (261, 28, 29, 3);
INSERT INTO Order_Details
  VALUES (262, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (263, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (263, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (263, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (263, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (264, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (265, 2, 1800, 4);
INSERT INTO Order_Details
  VALUES (265, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (265, 12, 23.5, 2);
INSERT INTO Order_Details
  VALUES (265, 17, 45, 1);
INSERT INTO Order_Details
  VALUES (265, 22, 82, 4);
INSERT INTO Order_Details
  VALUES (265, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (265, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (265, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (266, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (266, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (266, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (266, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (266, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (267, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (267, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (267, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (268, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (268, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (268, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (268, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (268, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (268, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (268, 32, 32, 4);
INSERT INTO Order_Details
  VALUES (268, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (269, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (269, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (269, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (269, 18, 179, 1);
INSERT INTO Order_Details
  VALUES (269, 28, 29, 3);
INSERT INTO Order_Details
  VALUES (269, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (269, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (270, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (270, 15, 4.99, 2);
INSERT INTO Order_Details
  VALUES (270, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (270, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (271, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (271, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (271, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (271, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (271, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (272, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (272, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (272, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (272, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (273, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (273, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (273, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (273, 30, 43.65, 5);
INSERT INTO Order_Details
  VALUES (273, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (274, 18, 179, 3);
INSERT INTO Order_Details
  VALUES (275, 5, 7.45, 2);
INSERT INTO Order_Details
  VALUES (276, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (276, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (276, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (276, 27, 24, 4);
INSERT INTO Order_Details
  VALUES (276, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (277, 12, 23.5, 1);
INSERT INTO Order_Details
  VALUES (277, 20, 14.55, 6);
INSERT INTO Order_Details
  VALUES (277, 28, 29, 2);
INSERT INTO Order_Details
  VALUES (277, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (278, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (278, 24, 69, 3);
INSERT INTO Order_Details
  VALUES (278, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (279, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (279, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (279, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (279, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (280, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (280, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (280, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (281, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (281, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (281, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (281, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (281, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (281, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (281, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (282, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (282, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (282, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (283, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (283, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (284, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (284, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (284, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (284, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (284, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (284, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (284, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (284, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (285, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (285, 17, 45, 1);
INSERT INTO Order_Details
  VALUES (285, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (285, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (286, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (286, 29, 34, 4);
INSERT INTO Order_Details
  VALUES (287, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (287, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (288, 8, 48.5, 5);
INSERT INTO Order_Details
  VALUES (288, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (289, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (289, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (289, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (289, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (290, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (290, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (290, 30, 45, 1);
INSERT INTO Order_Details
  VALUES (291, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (291, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (291, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (292, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (292, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (292, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (292, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (292, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (292, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (293, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (293, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (293, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (293, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (293, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (293, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (294, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (294, 15, 4.84, 6);
INSERT INTO Order_Details
  VALUES (294, 20, 15, 4);
INSERT INTO Order_Details
  VALUES (294, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (294, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (294, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (294, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (295, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (295, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (295, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (295, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (295, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (296, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (296, 34, 27, 2);
INSERT INTO Order_Details
  VALUES (297, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (297, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (298, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (298, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (299, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (299, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (300, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (300, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (300, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (300, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (300, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (300, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (301, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (301, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (301, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (302, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (302, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (302, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (303, 8, 48.5, 5);
INSERT INTO Order_Details
  VALUES (303, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (303, 18, 179, 4);
INSERT INTO Order_Details
  VALUES (303, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (303, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (303, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (304, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (304, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (304, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (304, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (304, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (306, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (306, 20, 15, 2);
INSERT INTO Order_Details
  VALUES (306, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (307, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (307, 7, 49, 2);
INSERT INTO Order_Details
  VALUES (307, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (307, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (307, 30, 45, 1);
INSERT INTO Order_Details
  VALUES (307, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (308, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (308, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (308, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (308, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (309, 5, 7.23, 5);
INSERT INTO Order_Details
  VALUES (309, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (309, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (309, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (309, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (310, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (310, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (310, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (310, 24, 69, 2);
INSERT INTO Order_Details
  VALUES (310, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (310, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (310, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (311, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (311, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (311, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (311, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (312, 15, 4.99, 4);
INSERT INTO Order_Details
  VALUES (312, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (312, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (312, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (312, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (313, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (313, 15, 4.84, 6);
INSERT INTO Order_Details
  VALUES (313, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (313, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (314, 20, 14.55, 5);
INSERT INTO Order_Details
  VALUES (314, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (315, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (315, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (315, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (315, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (315, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (315, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (316, 38, 161.02, 6);
INSERT INTO Order_Details
  VALUES (317, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (317, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (317, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (317, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (317, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (318, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (319, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (319, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (320, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (321, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (321, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (321, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (321, 24, 69, 1);
INSERT INTO Order_Details
  VALUES (321, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (321, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (322, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (323, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (323, 12, 23.5, 4);
INSERT INTO Order_Details
  VALUES (323, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (323, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (323, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (323, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (323, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (324, 8, 50, 1);
INSERT INTO Order_Details
  VALUES (325, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (325, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (325, 12, 23.5, 1);
INSERT INTO Order_Details
  VALUES (325, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (325, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (325, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (325, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (325, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (326, 8, 48.5, 5);
INSERT INTO Order_Details
  VALUES (327, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (327, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (327, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (327, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (327, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (328, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (329, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (329, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (329, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (329, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (329, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (329, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (329, 31, 21.34, 6);
INSERT INTO Order_Details
  VALUES (329, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (330, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (330, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (330, 27, 24, 3);
INSERT INTO Order_Details
  VALUES (330, 37, 189, 2);
INSERT INTO Order_Details
  VALUES (331, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (331, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (331, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (331, 20, 14.55, 5);
INSERT INTO Order_Details
  VALUES (331, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (331, 30, 45, 1);
INSERT INTO Order_Details
  VALUES (331, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (331, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (332, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (332, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (332, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (332, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (333, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (333, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (333, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (333, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (333, 38, 161.02, 6);
INSERT INTO Order_Details
  VALUES (334, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (334, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (334, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (334, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (334, 30, 43.65, 5);
INSERT INTO Order_Details
  VALUES (334, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (335, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (335, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (335, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (335, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (336, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (336, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (336, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (336, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (336, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (336, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (336, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (336, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (337, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (337, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (337, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (337, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (338, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (338, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (338, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (338, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (338, 40, 174.6, 5);
INSERT INTO Order_Details
  VALUES (339, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (339, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (339, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (339, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (339, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (339, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (339, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (340, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (340, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (340, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (341, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (342, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (342, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (342, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (343, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (343, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (343, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (344, 5, 7.23, 6);
INSERT INTO Order_Details
  VALUES (344, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (344, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (344, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (344, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (345, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (345, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (345, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (345, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (345, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (346, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (346, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (346, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (346, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (346, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (347, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (347, 24, 69, 4);
INSERT INTO Order_Details
  VALUES (347, 37, 189, 2);
INSERT INTO Order_Details
  VALUES (348, 7, 49, 2);
INSERT INTO Order_Details
  VALUES (348, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (348, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (348, 30, 45, 1);
INSERT INTO Order_Details
  VALUES (348, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (349, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (349, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (350, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (351, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (351, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (351, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (351, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (351, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (351, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (352, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (352, 22, 82, 3);
INSERT INTO Order_Details
  VALUES (352, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (353, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (353, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (353, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (353, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (353, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (353, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (353, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (353, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (354, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (354, 7, 49, 2);
INSERT INTO Order_Details
  VALUES (354, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (354, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (354, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (354, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (355, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (355, 12, 22.8, 5);
INSERT INTO Order_Details
  VALUES (355, 20, 15, 2);
INSERT INTO Order_Details
  VALUES (355, 28, 29, 3);
INSERT INTO Order_Details
  VALUES (355, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (356, 2, 1800, 1);
INSERT INTO Order_Details
  VALUES (356, 12, 23.5, 2);
INSERT INTO Order_Details
  VALUES (356, 22, 82, 3);
INSERT INTO Order_Details
  VALUES (356, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (357, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (357, 12, 22.8, 5);
INSERT INTO Order_Details
  VALUES (357, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (357, 22, 82, 4);
INSERT INTO Order_Details
  VALUES (357, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (357, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (357, 37, 189, 2);
INSERT INTO Order_Details
  VALUES (358, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (358, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (358, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (358, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (358, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (358, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (358, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (358, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (359, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (359, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (359, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (359, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (359, 30, 43.65, 5);
INSERT INTO Order_Details
  VALUES (359, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (359, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (360, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (360, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (360, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (360, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (360, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (360, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (360, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (362, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (362, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (362, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (362, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (362, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (362, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (362, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (363, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (363, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (363, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (363, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (363, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (363, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (363, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (363, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (364, 3, 75, 3);
INSERT INTO Order_Details
  VALUES (364, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (364, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (365, 20, 14.55, 6);
INSERT INTO Order_Details
  VALUES (365, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (366, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (366, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (366, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (366, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (366, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (366, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (366, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (367, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (367, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (367, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (367, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (367, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (367, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (368, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (368, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (369, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (370, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (370, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (370, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (370, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (370, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (371, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (371, 22, 79.54, 5);
INSERT INTO Order_Details
  VALUES (371, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (372, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (372, 8, 48.5, 5);
INSERT INTO Order_Details
  VALUES (372, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (372, 18, 173.63, 6);
INSERT INTO Order_Details
  VALUES (372, 28, 29, 3);
INSERT INTO Order_Details
  VALUES (372, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (372, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (373, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (373, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (373, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (373, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (373, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (373, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (373, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (373, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (374, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (374, 12, 23.5, 4);
INSERT INTO Order_Details
  VALUES (374, 22, 82, 4);
INSERT INTO Order_Details
  VALUES (374, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (375, 2, 1800, 2);
INSERT INTO Order_Details
  VALUES (375, 8, 50, 4);
INSERT INTO Order_Details
  VALUES (375, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (375, 20, 15, 4);
INSERT INTO Order_Details
  VALUES (375, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (375, 32, 32, 4);
INSERT INTO Order_Details
  VALUES (376, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (376, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (376, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (376, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (376, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (377, 8, 50, 4);
INSERT INTO Order_Details
  VALUES (377, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (377, 20, 14.55, 6);
INSERT INTO Order_Details
  VALUES (377, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (377, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (377, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (378, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (378, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (378, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (378, 18, 173.63, 5);
INSERT INTO Order_Details
  VALUES (378, 28, 29, 2);
INSERT INTO Order_Details
  VALUES (378, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (378, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (379, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (379, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (379, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (379, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (380, 24, 69, 3);
INSERT INTO Order_Details
  VALUES (381, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (381, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (381, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (381, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (381, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (381, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (381, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (382, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (383, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (383, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (383, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (383, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (383, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (383, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (383, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (383, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (384, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (384, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (385, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (385, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (385, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (385, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (385, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (385, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (385, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (385, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (386, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (386, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (386, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (386, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (386, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (387, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (387, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (387, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (387, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (387, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (387, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (387, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (387, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (388, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (388, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (388, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (388, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (388, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (389, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (389, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (389, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (389, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (390, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (390, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (390, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (390, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (390, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (390, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (390, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (390, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (391, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (391, 12, 23.5, 2);
INSERT INTO Order_Details
  VALUES (391, 18, 179, 1);
INSERT INTO Order_Details
  VALUES (391, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (391, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (391, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (392, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (392, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (392, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (392, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (393, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (393, 28, 29, 3);
INSERT INTO Order_Details
  VALUES (394, 15, 4.99, 3);
INSERT INTO Order_Details
  VALUES (394, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (395, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (396, 5, 7.45, 4);
INSERT INTO Order_Details
  VALUES (396, 15, 4.99, 2);
INSERT INTO Order_Details
  VALUES (396, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (396, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (397, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (398, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (398, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (398, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (398, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (398, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (398, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (398, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (398, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (399, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (399, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (399, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (399, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (399, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (399, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (399, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (399, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (400, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (400, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (400, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (400, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (400, 30, 45, 1);
INSERT INTO Order_Details
  VALUES (400, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (401, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (401, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (401, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (401, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (402, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (402, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (402, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (402, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (402, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (403, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (403, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (403, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (403, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (403, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (403, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (403, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (403, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (404, 2, 1746, 5);
INSERT INTO Order_Details
  VALUES (405, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (405, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (405, 27, 24, 3);
INSERT INTO Order_Details
  VALUES (405, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (406, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (406, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (406, 22, 79.54, 5);
INSERT INTO Order_Details
  VALUES (406, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (406, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (407, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (407, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (408, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (409, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (409, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (409, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (410, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (410, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (410, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (411, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (412, 10, 36, 4);
INSERT INTO Order_Details
  VALUES (412, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (412, 22, 82, 1);
INSERT INTO Order_Details
  VALUES (412, 28, 28.13, 6);
INSERT INTO Order_Details
  VALUES (412, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (412, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (413, 22, 82, 3);
INSERT INTO Order_Details
  VALUES (413, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (414, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (414, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (414, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (414, 20, 14.55, 5);
INSERT INTO Order_Details
  VALUES (414, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (414, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (414, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (414, 40, 174.6, 5);
INSERT INTO Order_Details
  VALUES (415, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (415, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (415, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (416, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (416, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (416, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (416, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (416, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (416, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (417, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (418, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (418, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (418, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (418, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (419, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (420, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (420, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (420, 22, 79.54, 5);
INSERT INTO Order_Details
  VALUES (420, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (420, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (421, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (421, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (422, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (422, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (423, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (423, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (423, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (423, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (423, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (423, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (424, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (425, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (425, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (425, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (426, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (426, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (426, 30, 45, 1);
INSERT INTO Order_Details
  VALUES (426, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (427, 5, 7.45, 4);
INSERT INTO Order_Details
  VALUES (427, 18, 179, 4);
INSERT INTO Order_Details
  VALUES (427, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (428, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (428, 15, 4.84, 5);
INSERT INTO Order_Details
  VALUES (428, 20, 15, 1);
INSERT INTO Order_Details
  VALUES (428, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (428, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (428, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (428, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (429, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (430, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (431, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (431, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (431, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (431, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (431, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (431, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (432, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (432, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (432, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (432, 38, 161.02, 6);
INSERT INTO Order_Details
  VALUES (433, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (433, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (433, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (433, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (433, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (433, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (433, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (434, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (434, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (434, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (434, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (434, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (434, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (434, 31, 21.34, 6);
INSERT INTO Order_Details
  VALUES (434, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (435, 12, 23.5, 2);
INSERT INTO Order_Details
  VALUES (436, 15, 4.84, 5);
INSERT INTO Order_Details
  VALUES (436, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (437, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (437, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (437, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (437, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (437, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (438, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (438, 12, 23.5, 2);
INSERT INTO Order_Details
  VALUES (438, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (438, 22, 82, 4);
INSERT INTO Order_Details
  VALUES (438, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (438, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (438, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (439, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (439, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (439, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (440, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (440, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (441, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (441, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (441, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (441, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (441, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (441, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (441, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (442, 12, 23.5, 4);
INSERT INTO Order_Details
  VALUES (442, 20, 15, 1);
INSERT INTO Order_Details
  VALUES (442, 28, 29, 2);
INSERT INTO Order_Details
  VALUES (442, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (443, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (443, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (443, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (443, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (443, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (444, 8, 50, 4);
INSERT INTO Order_Details
  VALUES (444, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (444, 18, 179, 3);
INSERT INTO Order_Details
  VALUES (444, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (444, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (444, 38, 161.02, 6);
INSERT INTO Order_Details
  VALUES (445, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (445, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (445, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (445, 29, 34, 4);
INSERT INTO Order_Details
  VALUES (445, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (446, 15, 4.99, 2);
INSERT INTO Order_Details
  VALUES (446, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (447, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (447, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (447, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (447, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (447, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (448, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (448, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (449, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (449, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (449, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (449, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (449, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (449, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (449, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (449, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (450, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (450, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (450, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (450, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (450, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (450, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (450, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (451, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (452, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (453, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (453, 7, 49, 2);
INSERT INTO Order_Details
  VALUES (453, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (453, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (453, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (453, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (454, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (454, 15, 4.99, 4);
INSERT INTO Order_Details
  VALUES (454, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (455, 18, 173.63, 6);
INSERT INTO Order_Details
  VALUES (455, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (456, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (457, 2, 1800, 1);
INSERT INTO Order_Details
  VALUES (457, 10, 36, 2);
INSERT INTO Order_Details
  VALUES (457, 18, 179, 2);
INSERT INTO Order_Details
  VALUES (457, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (457, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (458, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (458, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (458, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (458, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (459, 8, 48.5, 5);
INSERT INTO Order_Details
  VALUES (459, 18, 179, 2);
INSERT INTO Order_Details
  VALUES (459, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (459, 38, 161.02, 6);
INSERT INTO Order_Details
  VALUES (460, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (461, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (461, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (461, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (461, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (461, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (462, 10, 36, 1);
INSERT INTO Order_Details
  VALUES (462, 30, 43.65, 5);
INSERT INTO Order_Details
  VALUES (463, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (463, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (464, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (464, 24, 69, 3);
INSERT INTO Order_Details
  VALUES (464, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (465, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (465, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (465, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (465, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (465, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (465, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (465, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (465, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (466, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (466, 15, 4.99, 1);
INSERT INTO Order_Details
  VALUES (466, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (466, 27, 24, 3);
INSERT INTO Order_Details
  VALUES (466, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (466, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (467, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (467, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (467, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (468, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (468, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (468, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (468, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (468, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (469, 2, 1746, 5);
INSERT INTO Order_Details
  VALUES (469, 15, 4.99, 1);
INSERT INTO Order_Details
  VALUES (469, 28, 29, 2);
INSERT INTO Order_Details
  VALUES (470, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (470, 15, 4.99, 3);
INSERT INTO Order_Details
  VALUES (470, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (470, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (471, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (472, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (472, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (473, 10, 34.92, 5);
INSERT INTO Order_Details
  VALUES (473, 15, 4.99, 2);
INSERT INTO Order_Details
  VALUES (473, 20, 15, 1);
INSERT INTO Order_Details
  VALUES (473, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (473, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (473, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (473, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (474, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (474, 15, 4.99, 3);
INSERT INTO Order_Details
  VALUES (474, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (474, 27, 24, 4);
INSERT INTO Order_Details
  VALUES (474, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (474, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (475, 20, 14.55, 6);
INSERT INTO Order_Details
  VALUES (475, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (475, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (475, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (475, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (476, 18, 179, 3);
INSERT INTO Order_Details
  VALUES (476, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (477, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (477, 7, 49, 2);
INSERT INTO Order_Details
  VALUES (477, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (477, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (477, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (477, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (478, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (478, 14, 139.95, 3);
INSERT INTO Order_Details
  VALUES (478, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (478, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (478, 29, 34, 4);
INSERT INTO Order_Details
  VALUES (478, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (478, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (479, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (479, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (479, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (479, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (479, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (479, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (480, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (480, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (480, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (480, 30, 43.65, 5);
INSERT INTO Order_Details
  VALUES (480, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (481, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (481, 15, 4.99, 4);
INSERT INTO Order_Details
  VALUES (481, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (481, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (482, 24, 69, 3);
INSERT INTO Order_Details
  VALUES (483, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (483, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (483, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (483, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (485, 10, 34.92, 5);
INSERT INTO Order_Details
  VALUES (485, 15, 4.99, 1);
INSERT INTO Order_Details
  VALUES (485, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (485, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (485, 30, 45, 4);
INSERT INTO Order_Details
  VALUES (485, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (485, 40, 174.6, 5);
INSERT INTO Order_Details
  VALUES (486, 5, 7.45, 4);
INSERT INTO Order_Details
  VALUES (486, 10, 36, 1);
INSERT INTO Order_Details
  VALUES (486, 15, 4.84, 5);
INSERT INTO Order_Details
  VALUES (486, 20, 15, 1);
INSERT INTO Order_Details
  VALUES (486, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (486, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (486, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (486, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (487, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (487, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (487, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (487, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (488, 10, 36, 1);
INSERT INTO Order_Details
  VALUES (488, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (489, 5, 7.23, 5);
INSERT INTO Order_Details
  VALUES (489, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (490, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (490, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (490, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (491, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (491, 7, 49, 2);
INSERT INTO Order_Details
  VALUES (491, 22, 79.54, 5);
INSERT INTO Order_Details
  VALUES (491, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (491, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (491, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (492, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (492, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (492, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (492, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (492, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (492, 38, 161.02, 6);
INSERT INTO Order_Details
  VALUES (493, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (493, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (494, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (495, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (495, 15, 4.99, 1);
INSERT INTO Order_Details
  VALUES (495, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (495, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (495, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (495, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (496, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (496, 14, 139.95, 3);
INSERT INTO Order_Details
  VALUES (496, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (497, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (497, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (497, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (497, 24, 69, 2);
INSERT INTO Order_Details
  VALUES (497, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (497, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (497, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (498, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (498, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (498, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (498, 22, 82, 1);
INSERT INTO Order_Details
  VALUES (498, 27, 24, 3);
INSERT INTO Order_Details
  VALUES (498, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (498, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (499, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (499, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (499, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (499, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (500, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (500, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (500, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (500, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (501, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (501, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (501, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (501, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (502, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (502, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (502, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (502, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (503, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (503, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (503, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (503, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (503, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (504, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (505, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (505, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (505, 20, 14.55, 6);
INSERT INTO Order_Details
  VALUES (505, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (505, 30, 45, 4);
INSERT INTO Order_Details
  VALUES (505, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (505, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (506, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (506, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (507, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (507, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (507, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (507, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (508, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (508, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (508, 30, 43.65, 5);
INSERT INTO Order_Details
  VALUES (508, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (509, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (509, 18, 173.63, 5);
INSERT INTO Order_Details
  VALUES (509, 28, 29, 2);
INSERT INTO Order_Details
  VALUES (509, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (510, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (510, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (510, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (510, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (511, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (511, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (511, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (511, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (512, 8, 48.5, 6);
INSERT INTO Order_Details
  VALUES (513, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (513, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (513, 15, 4.99, 2);
INSERT INTO Order_Details
  VALUES (513, 20, 14.55, 5);
INSERT INTO Order_Details
  VALUES (513, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (513, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (513, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (513, 40, 174.6, 5);
INSERT INTO Order_Details
  VALUES (514, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (514, 10, 36, 3);
INSERT INTO Order_Details
  VALUES (514, 18, 179, 4);
INSERT INTO Order_Details
  VALUES (514, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (514, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (515, 10, 36, 4);
INSERT INTO Order_Details
  VALUES (515, 18, 179, 4);
INSERT INTO Order_Details
  VALUES (515, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (515, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (516, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (516, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (516, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (517, 5, 7.45, 1);
INSERT INTO Order_Details
  VALUES (517, 10, 36, 2);
INSERT INTO Order_Details
  VALUES (517, 15, 4.99, 2);
INSERT INTO Order_Details
  VALUES (517, 20, 15, 4);
INSERT INTO Order_Details
  VALUES (517, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (517, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (517, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (518, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (518, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (519, 5, 7.23, 6);
INSERT INTO Order_Details
  VALUES (519, 15, 4.99, 3);
INSERT INTO Order_Details
  VALUES (519, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (519, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (520, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (520, 12, 22.8, 5);
INSERT INTO Order_Details
  VALUES (520, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (520, 22, 82, 1);
INSERT INTO Order_Details
  VALUES (520, 27, 24, 4);
INSERT INTO Order_Details
  VALUES (520, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (520, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (521, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (521, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (522, 15, 4.99, 1);
INSERT INTO Order_Details
  VALUES (524, 29, 34, 4);
INSERT INTO Order_Details
  VALUES (525, 3, 75, 2);
INSERT INTO Order_Details
  VALUES (525, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (525, 15, 4.84, 6);
INSERT INTO Order_Details
  VALUES (525, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (525, 27, 24, 4);
INSERT INTO Order_Details
  VALUES (525, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (526, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (526, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (527, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (528, 2, 1800, 3);
INSERT INTO Order_Details
  VALUES (528, 22, 82, 3);
INSERT INTO Order_Details
  VALUES (529, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (529, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (529, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (529, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (529, 33, 18.43, 5);
INSERT INTO Order_Details
  VALUES (530, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (530, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (530, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (530, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (530, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (530, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (530, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (531, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (531, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (531, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (531, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (531, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (531, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (532, 5, 7.23, 5);
INSERT INTO Order_Details
  VALUES (532, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (532, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (532, 29, 34, 4);
INSERT INTO Order_Details
  VALUES (532, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (533, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (533, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (533, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (533, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (533, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (533, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (533, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (534, 5, 7.45, 2);
INSERT INTO Order_Details
  VALUES (534, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (535, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (535, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (535, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (536, 10, 36, 4);
INSERT INTO Order_Details
  VALUES (536, 15, 4.99, 3);
INSERT INTO Order_Details
  VALUES (536, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (536, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (536, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (536, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (536, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (537, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (537, 17, 45, 1);
INSERT INTO Order_Details
  VALUES (537, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (537, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (538, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (538, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (538, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (538, 20, 15, 2);
INSERT INTO Order_Details
  VALUES (538, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (538, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (538, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (538, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (539, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (539, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (539, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (539, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (539, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (539, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (539, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (539, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (540, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (540, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (540, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (540, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (540, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (541, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (541, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (541, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (541, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (542, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (542, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (542, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (543, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (544, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (544, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (544, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (544, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (544, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (544, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (544, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (545, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (545, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (545, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (545, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (545, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (545, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (545, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (546, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (546, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (547, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (547, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (547, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (547, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (547, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (548, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (548, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (548, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (548, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (548, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (548, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (549, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (550, 10, 36, 1);
INSERT INTO Order_Details
  VALUES (550, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (550, 22, 82, 1);
INSERT INTO Order_Details
  VALUES (550, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (550, 34, 27, 2);
INSERT INTO Order_Details
  VALUES (550, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (551, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (551, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (551, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (551, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (551, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (551, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (552, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (552, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (552, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (552, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (552, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (552, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (552, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (553, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (553, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (553, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (553, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (554, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (554, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (554, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (554, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (554, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (555, 3, 72.75, 5);
INSERT INTO Order_Details
  VALUES (555, 8, 50, 3);
INSERT INTO Order_Details
  VALUES (555, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (555, 18, 179, 2);
INSERT INTO Order_Details
  VALUES (555, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (555, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (555, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (556, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (556, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (556, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (556, 28, 28.13, 6);
INSERT INTO Order_Details
  VALUES (556, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (557, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (557, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (557, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (557, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (557, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (557, 31, 21.34, 6);
INSERT INTO Order_Details
  VALUES (557, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (558, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (558, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (558, 20, 15, 1);
INSERT INTO Order_Details
  VALUES (558, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (558, 30, 43.65, 5);
INSERT INTO Order_Details
  VALUES (558, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (558, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (559, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (559, 8, 50, 4);
INSERT INTO Order_Details
  VALUES (559, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (559, 18, 179, 4);
INSERT INTO Order_Details
  VALUES (559, 28, 28.13, 6);
INSERT INTO Order_Details
  VALUES (559, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (559, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (560, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (560, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (560, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (560, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (560, 34, 27, 2);
INSERT INTO Order_Details
  VALUES (560, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (561, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (562, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (563, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (563, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (563, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (563, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (563, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (563, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (564, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (564, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (565, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (565, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (566, 10, 34.92, 5);
INSERT INTO Order_Details
  VALUES (566, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (566, 22, 82, 3);
INSERT INTO Order_Details
  VALUES (566, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (566, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (566, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (567, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (567, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (568, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (569, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (569, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (569, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (569, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (569, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (569, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (570, 15, 4.84, 6);
INSERT INTO Order_Details
  VALUES (570, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (570, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (571, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (571, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (571, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (572, 15, 4.99, 4);
INSERT INTO Order_Details
  VALUES (572, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (572, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (572, 33, 18.43, 5);
INSERT INTO Order_Details
  VALUES (572, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (573, 5, 7.45, 2);
INSERT INTO Order_Details
  VALUES (573, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (573, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (573, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (573, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (574, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (575, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (575, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (575, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (575, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (575, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (575, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (575, 31, 21.34, 6);
INSERT INTO Order_Details
  VALUES (575, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (576, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (577, 12, 23.5, 1);
INSERT INTO Order_Details
  VALUES (577, 20, 14.55, 5);
INSERT INTO Order_Details
  VALUES (577, 28, 29, 3);
INSERT INTO Order_Details
  VALUES (577, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (578, 8, 48.5, 5);
INSERT INTO Order_Details
  VALUES (578, 18, 179, 3);
INSERT INTO Order_Details
  VALUES (578, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (578, 38, 161.02, 6);
INSERT INTO Order_Details
  VALUES (579, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (579, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (579, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (579, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (579, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (579, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (579, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (580, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (580, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (581, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (581, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (581, 30, 45, 1);
INSERT INTO Order_Details
  VALUES (581, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (581, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (582, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (582, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (582, 14, 139.95, 1);
INSERT INTO Order_Details
  VALUES (582, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (582, 24, 69, 4);
INSERT INTO Order_Details
  VALUES (582, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (582, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (582, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (583, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (583, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (583, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (583, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (583, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (584, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (584, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (584, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (584, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (585, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (585, 18, 179, 3);
INSERT INTO Order_Details
  VALUES (585, 31, 21.34, 6);
INSERT INTO Order_Details
  VALUES (586, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (587, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (587, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (588, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (588, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (588, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (588, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (589, 10, 34.92, 6);
INSERT INTO Order_Details
  VALUES (589, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (590, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (590, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (590, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (590, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (590, 30, 43.65, 5);
INSERT INTO Order_Details
  VALUES (590, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (590, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (591, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (591, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (591, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (591, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (591, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (592, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (592, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (592, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (592, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (592, 33, 18.43, 5);
INSERT INTO Order_Details
  VALUES (592, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (593, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (594, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (594, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (594, 18, 173.63, 5);
INSERT INTO Order_Details
  VALUES (594, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (594, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (595, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (596, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (596, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (596, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (596, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (596, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (597, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (597, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (597, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (597, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (597, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (597, 30, 45, 4);
INSERT INTO Order_Details
  VALUES (597, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (597, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (598, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (598, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (598, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (598, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (598, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (598, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (598, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (599, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (599, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (599, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (600, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (600, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (600, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (600, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (600, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (600, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (600, 31, 21.34, 6);
INSERT INTO Order_Details
  VALUES (600, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (601, 12, 22.8, 6);
INSERT INTO Order_Details
  VALUES (602, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (603, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (603, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (603, 28, 28.13, 6);
INSERT INTO Order_Details
  VALUES (603, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (604, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (604, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (604, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (605, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (605, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (605, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (605, 27, 24, 3);
INSERT INTO Order_Details
  VALUES (605, 33, 18.43, 5);
INSERT INTO Order_Details
  VALUES (605, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (606, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (606, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (606, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (607, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (607, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (608, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (608, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (608, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (608, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (609, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (609, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (609, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (609, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (609, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (610, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (610, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (610, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (610, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (610, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (610, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (610, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (611, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (611, 15, 4.99, 2);
INSERT INTO Order_Details
  VALUES (611, 20, 15, 1);
INSERT INTO Order_Details
  VALUES (611, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (611, 30, 45, 1);
INSERT INTO Order_Details
  VALUES (611, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (611, 40, 174.6, 5);
INSERT INTO Order_Details
  VALUES (612, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (612, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (612, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (612, 24, 69, 4);
INSERT INTO Order_Details
  VALUES (612, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (612, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (612, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (613, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (614, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (614, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (614, 34, 27, 2);
INSERT INTO Order_Details
  VALUES (615, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (615, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (615, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (615, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (615, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (615, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (615, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (615, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (616, 18, 179, 2);
INSERT INTO Order_Details
  VALUES (616, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (617, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (617, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (617, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (617, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (617, 24, 69, 4);
INSERT INTO Order_Details
  VALUES (617, 29, 34, 4);
INSERT INTO Order_Details
  VALUES (617, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (617, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (618, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (618, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (618, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (618, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (619, 3, 75, 3);
INSERT INTO Order_Details
  VALUES (620, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (620, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (620, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (620, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (620, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (620, 28, 29, 3);
INSERT INTO Order_Details
  VALUES (620, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (620, 38, 161.02, 6);
INSERT INTO Order_Details
  VALUES (621, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (622, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (622, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (622, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (622, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (622, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (623, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (623, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (624, 12, 23.5, 2);
INSERT INTO Order_Details
  VALUES (624, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (624, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (624, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (625, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (625, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (625, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (625, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (625, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (625, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (626, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (626, 27, 24, 3);
INSERT INTO Order_Details
  VALUES (626, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (627, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (627, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (628, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (630, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (630, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (630, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (630, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (631, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (631, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (631, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (631, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (631, 33, 18.43, 5);
INSERT INTO Order_Details
  VALUES (631, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (633, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (633, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (634, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (634, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (634, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (634, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (635, 8, 48.5, 5);
INSERT INTO Order_Details
  VALUES (635, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (635, 20, 15, 4);
INSERT INTO Order_Details
  VALUES (635, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (635, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (635, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (636, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (636, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (636, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (636, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (636, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (636, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (636, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (636, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (637, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (637, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (637, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (637, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (637, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (637, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (637, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (637, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (638, 8, 50, 4);
INSERT INTO Order_Details
  VALUES (638, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (639, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (639, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (639, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (639, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (639, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (639, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (640, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (640, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (640, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (641, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (641, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (641, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (641, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (642, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (642, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (642, 17, 45, 1);
INSERT INTO Order_Details
  VALUES (642, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (642, 37, 189, 2);
INSERT INTO Order_Details
  VALUES (643, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (643, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (643, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (643, 37, 189, 2);
INSERT INTO Order_Details
  VALUES (644, 3, 75, 2);
INSERT INTO Order_Details
  VALUES (644, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (644, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (645, 10, 34.92, 5);
INSERT INTO Order_Details
  VALUES (645, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (646, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (647, 3, 75, 1);
INSERT INTO Order_Details
  VALUES (647, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (647, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (648, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (649, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (649, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (649, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (650, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (650, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (650, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (651, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (651, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (651, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (651, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (651, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (651, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (652, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (652, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (652, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (652, 24, 69, 4);
INSERT INTO Order_Details
  VALUES (652, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (652, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (652, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (653, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (653, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (654, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (654, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (654, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (654, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (654, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (654, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (654, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (655, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (655, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (655, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (655, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (655, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (656, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (656, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (656, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (656, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (657, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (657, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (657, 30, 45, 1);
INSERT INTO Order_Details
  VALUES (657, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (658, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (658, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (658, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (658, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (658, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (659, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (659, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (659, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (660, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (660, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (660, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (660, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (660, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (660, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (661, 2, 1800, 3);
INSERT INTO Order_Details
  VALUES (661, 15, 4.84, 5);
INSERT INTO Order_Details
  VALUES (661, 28, 29, 1);
INSERT INTO Order_Details
  VALUES (662, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (662, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (662, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (662, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (662, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (662, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (662, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (663, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (663, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (663, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (663, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (663, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (664, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (664, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (665, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (665, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (665, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (665, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (666, 2, 1800, 3);
INSERT INTO Order_Details
  VALUES (666, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (667, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (667, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (667, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (667, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (667, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (667, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (668, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (668, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (668, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (668, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (668, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (669, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (669, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (669, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (669, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (669, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (669, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (670, 12, 22.8, 5);
INSERT INTO Order_Details
  VALUES (670, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (670, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (671, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (671, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (671, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (671, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (671, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (671, 33, 18.43, 5);
INSERT INTO Order_Details
  VALUES (671, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (672, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (672, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (672, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (672, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (672, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (673, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (673, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (673, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (674, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (674, 30, 43.65, 5);
INSERT INTO Order_Details
  VALUES (675, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (675, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (675, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (675, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (675, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (676, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (676, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (676, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (676, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (676, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (676, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (676, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (677, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (677, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (677, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (677, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (677, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (677, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (678, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (678, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (678, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (678, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (678, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (678, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (678, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (679, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (679, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (679, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (679, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (679, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (679, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (679, 31, 21.34, 6);
INSERT INTO Order_Details
  VALUES (679, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (680, 8, 48.5, 6);
INSERT INTO Order_Details
  VALUES (680, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (680, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (680, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (680, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (680, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (681, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (681, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (681, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (681, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (682, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (682, 7, 49, 2);
INSERT INTO Order_Details
  VALUES (682, 12, 23.5, 3);
INSERT INTO Order_Details
  VALUES (682, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (682, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (682, 27, 24, 4);
INSERT INTO Order_Details
  VALUES (682, 32, 32, 4);
INSERT INTO Order_Details
  VALUES (682, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (683, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (684, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (684, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (684, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (684, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (684, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (684, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (684, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (684, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (685, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (685, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (685, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (685, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (685, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (685, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (685, 37, 189, 2);
INSERT INTO Order_Details
  VALUES (686, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (686, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (686, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (686, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (686, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (686, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (687, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (687, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (687, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (687, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (687, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (688, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (688, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (688, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (688, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (688, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (690, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (690, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (690, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (690, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (691, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (691, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (691, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (691, 18, 179, 3);
INSERT INTO Order_Details
  VALUES (691, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (691, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (691, 38, 161.02, 6);
INSERT INTO Order_Details
  VALUES (692, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (692, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (693, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (693, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (693, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (693, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (694, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (694, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (694, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (694, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (694, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (694, 40, 174.6, 5);
INSERT INTO Order_Details
  VALUES (695, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (695, 24, 69, 2);
INSERT INTO Order_Details
  VALUES (696, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (696, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (696, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (696, 20, 14.55, 6);
INSERT INTO Order_Details
  VALUES (696, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (696, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (696, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (696, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (697, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (697, 20, 15, 2);
INSERT INTO Order_Details
  VALUES (697, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (698, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (698, 17, 45, 1);
INSERT INTO Order_Details
  VALUES (698, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (698, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (699, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (699, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (699, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (699, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (700, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (700, 28, 29, 2);
INSERT INTO Order_Details
  VALUES (701, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (701, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (701, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (702, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (702, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (702, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (702, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (702, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (702, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (702, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (703, 20, 15, 2);
INSERT INTO Order_Details
  VALUES (703, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (704, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (704, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (705, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (705, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (706, 8, 50, 3);
INSERT INTO Order_Details
  VALUES (706, 18, 173.63, 6);
INSERT INTO Order_Details
  VALUES (706, 28, 28.13, 6);
INSERT INTO Order_Details
  VALUES (706, 38, 161.02, 6);
INSERT INTO Order_Details
  VALUES (707, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (708, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (708, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (708, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (708, 18, 179, 1);
INSERT INTO Order_Details
  VALUES (708, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (708, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (708, 38, 161.02, 6);
INSERT INTO Order_Details
  VALUES (709, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (709, 12, 23.5, 1);
INSERT INTO Order_Details
  VALUES (709, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (709, 22, 82, 3);
INSERT INTO Order_Details
  VALUES (709, 27, 24, 3);
INSERT INTO Order_Details
  VALUES (709, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (709, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (710, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (710, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (710, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (710, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (710, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (711, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (711, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (711, 14, 139.95, 3);
INSERT INTO Order_Details
  VALUES (711, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (711, 24, 69, 2);
INSERT INTO Order_Details
  VALUES (711, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (711, 34, 27, 2);
INSERT INTO Order_Details
  VALUES (711, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (712, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (712, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (712, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (712, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (712, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (713, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (714, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (714, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (714, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (714, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (714, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (714, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (714, 31, 21.34, 6);
INSERT INTO Order_Details
  VALUES (714, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (715, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (715, 7, 49, 2);
INSERT INTO Order_Details
  VALUES (715, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (715, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (715, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (715, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (716, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (716, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (717, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (717, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (717, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (717, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (717, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (717, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (718, 12, 22.8, 6);
INSERT INTO Order_Details
  VALUES (718, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (718, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (719, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (719, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (719, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (720, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (720, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (720, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (721, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (721, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (721, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (721, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (722, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (722, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (722, 33, 18.43, 5);
INSERT INTO Order_Details
  VALUES (723, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (723, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (723, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (723, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (724, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (724, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (724, 18, 179, 2);
INSERT INTO Order_Details
  VALUES (724, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (724, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (725, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (725, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (726, 3, 75, 2);
INSERT INTO Order_Details
  VALUES (726, 8, 48.5, 5);
INSERT INTO Order_Details
  VALUES (726, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (726, 18, 179, 1);
INSERT INTO Order_Details
  VALUES (726, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (726, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (727, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (727, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (727, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (727, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (727, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (727, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (727, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (728, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (728, 22, 82, 1);
INSERT INTO Order_Details
  VALUES (728, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (729, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (729, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (729, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (730, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (730, 9, 32.01, 5);
INSERT INTO Order_Details
  VALUES (730, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (730, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (731, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (731, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (731, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (731, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (731, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (731, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (732, 18, 179, 2);
INSERT INTO Order_Details
  VALUES (732, 28, 29, 2);
INSERT INTO Order_Details
  VALUES (732, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (732, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (733, 8, 50, 1);
INSERT INTO Order_Details
  VALUES (733, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (733, 24, 69, 1);
INSERT INTO Order_Details
  VALUES (733, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (733, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (734, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (735, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (735, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (735, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (735, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (735, 34, 27, 2);
INSERT INTO Order_Details
  VALUES (735, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (736, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (736, 27, 24, 4);
INSERT INTO Order_Details
  VALUES (736, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (737, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (738, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (738, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (738, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (738, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (739, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (740, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (740, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (740, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (740, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (740, 28, 29, 2);
INSERT INTO Order_Details
  VALUES (740, 33, 18.43, 5);
INSERT INTO Order_Details
  VALUES (740, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (741, 2, 1800, 4);
INSERT INTO Order_Details
  VALUES (741, 8, 48.5, 5);
INSERT INTO Order_Details
  VALUES (741, 14, 139.95, 1);
INSERT INTO Order_Details
  VALUES (741, 20, 15, 1);
INSERT INTO Order_Details
  VALUES (741, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (741, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (742, 5, 7.45, 1);
INSERT INTO Order_Details
  VALUES (742, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (742, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (742, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (742, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (743, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (743, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (743, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (743, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (744, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (744, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (744, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (744, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (744, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (744, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (744, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (744, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (745, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (745, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (745, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (745, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (745, 24, 69, 3);
INSERT INTO Order_Details
  VALUES (745, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (745, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (745, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (746, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (746, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (746, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (746, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (746, 32, 32, 4);
INSERT INTO Order_Details
  VALUES (746, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (747, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (747, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (747, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (747, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (747, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (747, 35, 39, 2);
INSERT INTO Order_Details
  VALUES (748, 5, 7.45, 4);
INSERT INTO Order_Details
  VALUES (748, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (748, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (748, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (748, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (749, 8, 50, 4);
INSERT INTO Order_Details
  VALUES (750, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (750, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (750, 15, 4.99, 4);
INSERT INTO Order_Details
  VALUES (750, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (750, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (750, 30, 45, 4);
INSERT INTO Order_Details
  VALUES (750, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (750, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (751, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (751, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (751, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (751, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (751, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (752, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (752, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (752, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (752, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (752, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (752, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (752, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (752, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (754, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (755, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (755, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (755, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (755, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (755, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (755, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (755, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (756, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (756, 26, 125, 2);
INSERT INTO Order_Details
  VALUES (756, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (757, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (757, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (757, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (757, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (757, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (757, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (757, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (758, 28, 28.13, 6);
INSERT INTO Order_Details
  VALUES (759, 8, 50, 4);
INSERT INTO Order_Details
  VALUES (759, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (759, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (760, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (760, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (760, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (760, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (760, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (760, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (760, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (761, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (761, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (761, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (761, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (761, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (761, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (762, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (762, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (762, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (762, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (762, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (762, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (762, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (762, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (763, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (763, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (764, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (764, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (765, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (765, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (765, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (765, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (765, 33, 18.43, 5);
INSERT INTO Order_Details
  VALUES (766, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (766, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (767, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (767, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (767, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (767, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (767, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (767, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (768, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (769, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (769, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (769, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (769, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (769, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (769, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (769, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (769, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (770, 10, 36, 4);
INSERT INTO Order_Details
  VALUES (771, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (771, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (772, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (772, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (772, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (772, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (773, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (774, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (774, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (774, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (774, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (774, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (775, 3, 75, 3);
INSERT INTO Order_Details
  VALUES (775, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (775, 15, 4.99, 4);
INSERT INTO Order_Details
  VALUES (775, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (775, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (775, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (776, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (776, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (776, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (776, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (777, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (777, 18, 179, 3);
INSERT INTO Order_Details
  VALUES (777, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (777, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (778, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (778, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (778, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (779, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (779, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (779, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (779, 24, 69, 2);
INSERT INTO Order_Details
  VALUES (779, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (779, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (779, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (780, 5, 7.45, 1);
INSERT INTO Order_Details
  VALUES (780, 10, 34.92, 5);
INSERT INTO Order_Details
  VALUES (780, 15, 4.99, 1);
INSERT INTO Order_Details
  VALUES (780, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (780, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (780, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (780, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (780, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (781, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (781, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (781, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (781, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (781, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (782, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (783, 2, 1800, 3);
INSERT INTO Order_Details
  VALUES (783, 10, 34.92, 6);
INSERT INTO Order_Details
  VALUES (783, 18, 173.63, 5);
INSERT INTO Order_Details
  VALUES (783, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (783, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (784, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (784, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (784, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (785, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (785, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (785, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (786, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (786, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (786, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (786, 40, 174.6, 5);
INSERT INTO Order_Details
  VALUES (787, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (787, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (787, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (787, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (787, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (787, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (787, 32, 31.04, 5);
INSERT INTO Order_Details
  VALUES (787, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (788, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (788, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (788, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (788, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (789, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (789, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (789, 27, 24, 3);
INSERT INTO Order_Details
  VALUES (789, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (790, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (790, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (790, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (790, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (790, 25, 139, 3);
INSERT INTO Order_Details
  VALUES (790, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (791, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (791, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (791, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (792, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (792, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (793, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (793, 22, 79.54, 5);
INSERT INTO Order_Details
  VALUES (793, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (794, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (794, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (794, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (795, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (795, 22, 82, 4);
INSERT INTO Order_Details
  VALUES (795, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (796, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (796, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (796, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (797, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (797, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (797, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (797, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (797, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (797, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (797, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (797, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (798, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (798, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (798, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (798, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (799, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (799, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (799, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (799, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (799, 30, 45, 4);
INSERT INTO Order_Details
  VALUES (799, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (800, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (800, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (800, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (800, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (801, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (801, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (801, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (801, 28, 28.13, 6);
INSERT INTO Order_Details
  VALUES (801, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (801, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (802, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (802, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (803, 18, 179, 3);
INSERT INTO Order_Details
  VALUES (803, 38, 161.02, 5);
INSERT INTO Order_Details
  VALUES (804, 5, 7.45, 3);
INSERT INTO Order_Details
  VALUES (804, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (804, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (804, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (804, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (805, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (805, 14, 139.95, 3);
INSERT INTO Order_Details
  VALUES (805, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (806, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (806, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (806, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (806, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (806, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (807, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (807, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (807, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (807, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (808, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (808, 22, 82, 4);
INSERT INTO Order_Details
  VALUES (808, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (809, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (809, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (809, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (809, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (809, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (810, 15, 4.99, 3);
INSERT INTO Order_Details
  VALUES (810, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (810, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (811, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (811, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (812, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (812, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (812, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (812, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (813, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (813, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (813, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (813, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (813, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (813, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (813, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (813, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (814, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (815, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (815, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (815, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (815, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (815, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (815, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (815, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (817, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (817, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (817, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (817, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (817, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (818, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (818, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (818, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (818, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (819, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (819, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (819, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (819, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (819, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (819, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (819, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (820, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (821, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (821, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (822, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (822, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (822, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (822, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (822, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (823, 29, 34, 2);
INSERT INTO Order_Details
  VALUES (824, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (824, 22, 79.54, 5);
INSERT INTO Order_Details
  VALUES (825, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (825, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (825, 37, 189, 2);
INSERT INTO Order_Details
  VALUES (826, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (826, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (826, 13, 65.47, 6);
INSERT INTO Order_Details
  VALUES (826, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (826, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (826, 31, 21.34, 6);
INSERT INTO Order_Details
  VALUES (827, 5, 7.45, 2);
INSERT INTO Order_Details
  VALUES (827, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (827, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (827, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (827, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (828, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (828, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (828, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (828, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (828, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (828, 40, 180, 2);
INSERT INTO Order_Details
  VALUES (829, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (829, 7, 47.53, 5);
INSERT INTO Order_Details
  VALUES (829, 13, 67.5, 3);
INSERT INTO Order_Details
  VALUES (829, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (829, 32, 32, 4);
INSERT INTO Order_Details
  VALUES (829, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (830, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (830, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (831, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (831, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (831, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (832, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (833, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (833, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (833, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (833, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (833, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (834, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (834, 12, 23.5, 3);
INSERT INTO Order_Details
  VALUES (834, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (834, 22, 82, 3);
INSERT INTO Order_Details
  VALUES (834, 27, 24, 4);
INSERT INTO Order_Details
  VALUES (834, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (834, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (835, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (835, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (835, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (836, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (836, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (836, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (836, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (837, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (837, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (837, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (837, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (838, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (838, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (838, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (838, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (838, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (838, 33, 19, 1);
INSERT INTO Order_Details
  VALUES (838, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (839, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (839, 9, 33, 2);
INSERT INTO Order_Details
  VALUES (839, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (839, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (839, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (840, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (840, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (840, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (841, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (841, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (841, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (841, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (841, 22, 82, 4);
INSERT INTO Order_Details
  VALUES (841, 27, 24, 3);
INSERT INTO Order_Details
  VALUES (841, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (841, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (842, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (842, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (843, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (843, 24, 69, 3);
INSERT INTO Order_Details
  VALUES (844, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (844, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (844, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (844, 34, 27, 4);
INSERT INTO Order_Details
  VALUES (845, 18, 179, 4);
INSERT INTO Order_Details
  VALUES (846, 5, 7.23, 6);
INSERT INTO Order_Details
  VALUES (846, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (846, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (846, 29, 34, 4);
INSERT INTO Order_Details
  VALUES (846, 37, 189, 4);
INSERT INTO Order_Details
  VALUES (847, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (847, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (847, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (847, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (847, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (847, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (847, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (848, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (848, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (848, 17, 45, 1);
INSERT INTO Order_Details
  VALUES (848, 29, 34, 4);
INSERT INTO Order_Details
  VALUES (848, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (849, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (849, 27, 23.28, 6);
INSERT INTO Order_Details
  VALUES (850, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (850, 21, 53.35, 5);
INSERT INTO Order_Details
  VALUES (850, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (850, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (851, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (851, 14, 139.95, 3);
INSERT INTO Order_Details
  VALUES (851, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (851, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (851, 29, 32.98, 5);
INSERT INTO Order_Details
  VALUES (851, 34, 27, 2);
INSERT INTO Order_Details
  VALUES (851, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (852, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (852, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (852, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (852, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (852, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (852, 26, 125, 3);
INSERT INTO Order_Details
  VALUES (852, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (853, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (853, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (853, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (853, 16, 28, 3);
INSERT INTO Order_Details
  VALUES (853, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (853, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (853, 36, 160.05, 5);
INSERT INTO Order_Details
  VALUES (854, 2, 1746, 5);
INSERT INTO Order_Details
  VALUES (855, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (856, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (856, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (856, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (856, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (856, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (856, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (857, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (858, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (858, 19, 47, 2);
INSERT INTO Order_Details
  VALUES (858, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (858, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (859, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (859, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (859, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (860, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (860, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (860, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (860, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (860, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (861, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (861, 12, 23.5, 4);
INSERT INTO Order_Details
  VALUES (861, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (861, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (861, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (861, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (861, 37, 189, 2);
INSERT INTO Order_Details
  VALUES (862, 2, 1746, 6);
INSERT INTO Order_Details
  VALUES (862, 12, 22.8, 5);
INSERT INTO Order_Details
  VALUES (862, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (862, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (863, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (864, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (864, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (864, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (864, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (864, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (864, 26, 125, 4);
INSERT INTO Order_Details
  VALUES (864, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (864, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (865, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (865, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (865, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (865, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (865, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (865, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (865, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (865, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (866, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (867, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (867, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (867, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (867, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (867, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (868, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (868, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (868, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (868, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (869, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (869, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (870, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (870, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (870, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (870, 27, 24, 4);
INSERT INTO Order_Details
  VALUES (870, 35, 37.83, 6);
INSERT INTO Order_Details
  VALUES (871, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (871, 15, 4.99, 4);
INSERT INTO Order_Details
  VALUES (871, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (871, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (872, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (872, 6, 635, 3);
INSERT INTO Order_Details
  VALUES (872, 11, 1600.5, 5);
INSERT INTO Order_Details
  VALUES (872, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (872, 21, 55, 4);
INSERT INTO Order_Details
  VALUES (872, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (872, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (872, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (873, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (873, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (873, 24, 69, 2);
INSERT INTO Order_Details
  VALUES (873, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (874, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (874, 18, 173.63, 6);
INSERT INTO Order_Details
  VALUES (874, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (874, 38, 166, 3);
INSERT INTO Order_Details
  VALUES (875, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (875, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (876, 12, 23.5, 1);
INSERT INTO Order_Details
  VALUES (876, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (876, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (877, 24, 69, 2);
INSERT INTO Order_Details
  VALUES (878, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (878, 14, 139.95, 3);
INSERT INTO Order_Details
  VALUES (878, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (879, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (879, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (879, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (879, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (880, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (880, 33, 19, 4);
INSERT INTO Order_Details
  VALUES (881, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (881, 14, 139.95, 3);
INSERT INTO Order_Details
  VALUES (881, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (881, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (881, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (881, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (881, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (882, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (882, 15, 4.84, 5);
INSERT INTO Order_Details
  VALUES (882, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (882, 39, 175, 3);
INSERT INTO Order_Details
  VALUES (883, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (883, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (883, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (883, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (883, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (883, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (884, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (885, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (885, 33, 19, 2);
INSERT INTO Order_Details
  VALUES (886, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (886, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (886, 19, 47, 3);
INSERT INTO Order_Details
  VALUES (886, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (886, 29, 32.98, 6);
INSERT INTO Order_Details
  VALUES (886, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (886, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (887, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (887, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (887, 26, 125, 1);
INSERT INTO Order_Details
  VALUES (887, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (887, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (888, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (888, 12, 23.5, 2);
INSERT INTO Order_Details
  VALUES (888, 20, 15, 2);
INSERT INTO Order_Details
  VALUES (888, 28, 28.13, 6);
INSERT INTO Order_Details
  VALUES (888, 36, 165, 3);
INSERT INTO Order_Details
  VALUES (889, 29, 34, 4);
INSERT INTO Order_Details
  VALUES (890, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (891, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (891, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (891, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (891, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (891, 21, 55, 3);
INSERT INTO Order_Details
  VALUES (891, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (891, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (891, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (892, 35, 39, 4);
INSERT INTO Order_Details
  VALUES (893, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (893, 22, 82, 4);
INSERT INTO Order_Details
  VALUES (893, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (894, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (894, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (895, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (895, 6, 615.95, 6);
INSERT INTO Order_Details
  VALUES (895, 11, 1600.5, 6);
INSERT INTO Order_Details
  VALUES (895, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (895, 33, 19, 3);
INSERT INTO Order_Details
  VALUES (895, 38, 166, 1);
INSERT INTO Order_Details
  VALUES (896, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (896, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (896, 17, 45, 4);
INSERT INTO Order_Details
  VALUES (896, 29, 34, 1);
INSERT INTO Order_Details
  VALUES (896, 37, 189, 3);
INSERT INTO Order_Details
  VALUES (897, 10, 36, 1);
INSERT INTO Order_Details
  VALUES (897, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (897, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (897, 28, 29, 2);
INSERT INTO Order_Details
  VALUES (897, 34, 27, 2);
INSERT INTO Order_Details
  VALUES (897, 40, 174.6, 6);
INSERT INTO Order_Details
  VALUES (898, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (899, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (899, 14, 139.95, 4);
INSERT INTO Order_Details
  VALUES (899, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (899, 24, 69, 4);
INSERT INTO Order_Details
  VALUES (899, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (899, 34, 26.19, 5);
INSERT INTO Order_Details
  VALUES (899, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (900, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (900, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (900, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (900, 31, 21.34, 5);
INSERT INTO Order_Details
  VALUES (901, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (901, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (901, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (901, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (902, 2, 1800, 4);
INSERT INTO Order_Details
  VALUES (902, 22, 79.54, 5);
INSERT INTO Order_Details
  VALUES (903, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (903, 9, 32.01, 6);
INSERT INTO Order_Details
  VALUES (903, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (903, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (903, 40, 180, 3);
INSERT INTO Order_Details
  VALUES (904, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (904, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (904, 17, 45, 1);
INSERT INTO Order_Details
  VALUES (904, 30, 45, 4);
INSERT INTO Order_Details
  VALUES (904, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (905, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (905, 10, 36, 4);
INSERT INTO Order_Details
  VALUES (905, 15, 4.99, 4);
INSERT INTO Order_Details
  VALUES (905, 20, 14.55, 6);
INSERT INTO Order_Details
  VALUES (905, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (905, 30, 45, 3);
INSERT INTO Order_Details
  VALUES (905, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (905, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (906, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (906, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (906, 13, 67.5, 4);
INSERT INTO Order_Details
  VALUES (906, 19, 47, 4);
INSERT INTO Order_Details
  VALUES (906, 25, 139, 1);
INSERT INTO Order_Details
  VALUES (906, 39, 175, 2);
INSERT INTO Order_Details
  VALUES (907, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (907, 22, 79.54, 6);
INSERT INTO Order_Details
  VALUES (907, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (908, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (908, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (908, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (909, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (909, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (909, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (909, 33, 18.43, 5);
INSERT INTO Order_Details
  VALUES (910, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (910, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (910, 11, 1650, 3);
INSERT INTO Order_Details
  VALUES (910, 16, 27.16, 5);
INSERT INTO Order_Details
  VALUES (910, 21, 53.35, 6);
INSERT INTO Order_Details
  VALUES (910, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (910, 31, 22, 2);
INSERT INTO Order_Details
  VALUES (910, 36, 165, 2);
INSERT INTO Order_Details
  VALUES (911, 14, 135.75, 5);
INSERT INTO Order_Details
  VALUES (911, 34, 27, 1);
INSERT INTO Order_Details
  VALUES (912, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (912, 7, 49, 4);
INSERT INTO Order_Details
  VALUES (912, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (912, 28, 29, 4);
INSERT INTO Order_Details
  VALUES (912, 34, 27, 3);
INSERT INTO Order_Details
  VALUES (912, 40, 180, 4);
INSERT INTO Order_Details
  VALUES (913, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (913, 28, 28.13, 5);
INSERT INTO Order_Details
  VALUES (914, 21, 55, 1);
INSERT INTO Order_Details
  VALUES (915, 16, 28, 1);
INSERT INTO Order_Details
  VALUES (916, 7, 49, 1);
INSERT INTO Order_Details
  VALUES (916, 13, 65.47, 5);
INSERT INTO Order_Details
  VALUES (916, 19, 45.59, 5);
INSERT INTO Order_Details
  VALUES (916, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (916, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (916, 37, 189, 2);
INSERT INTO Order_Details
  VALUES (917, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (917, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (917, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (917, 25, 134.83, 5);
INSERT INTO Order_Details
  VALUES (917, 35, 39, 1);
INSERT INTO Order_Details
  VALUES (918, 36, 165, 4);
INSERT INTO Order_Details
  VALUES (919, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (919, 6, 615.95, 5);
INSERT INTO Order_Details
  VALUES (919, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (919, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (919, 27, 23.28, 5);
INSERT INTO Order_Details
  VALUES (919, 32, 31.04, 6);
INSERT INTO Order_Details
  VALUES (919, 37, 183.33, 6);
INSERT INTO Order_Details
  VALUES (920, 5, 7.23, 5);
INSERT INTO Order_Details
  VALUES (921, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (921, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (921, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (921, 31, 22, 1);
INSERT INTO Order_Details
  VALUES (922, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (922, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (922, 17, 45, 3);
INSERT INTO Order_Details
  VALUES (922, 25, 139, 2);
INSERT INTO Order_Details
  VALUES (922, 33, 18.43, 6);
INSERT INTO Order_Details
  VALUES (923, 5, 7.45, 2);
INSERT INTO Order_Details
  VALUES (923, 10, 34.92, 6);
INSERT INTO Order_Details
  VALUES (923, 15, 4.99, 2);
INSERT INTO Order_Details
  VALUES (923, 20, 15, 4);
INSERT INTO Order_Details
  VALUES (923, 25, 139, 4);
INSERT INTO Order_Details
  VALUES (923, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (923, 35, 39, 3);
INSERT INTO Order_Details
  VALUES (924, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (924, 39, 175, 1);
INSERT INTO Order_Details
  VALUES (925, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (925, 12, 22.8, 6);
INSERT INTO Order_Details
  VALUES (925, 18, 179, 4);
INSERT INTO Order_Details
  VALUES (925, 24, 66.93, 6);
INSERT INTO Order_Details
  VALUES (925, 30, 43.65, 5);
INSERT INTO Order_Details
  VALUES (925, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (926, 1, 1200, 4);
INSERT INTO Order_Details
  VALUES (926, 6, 635, 4);
INSERT INTO Order_Details
  VALUES (926, 20, 15, 2);
INSERT INTO Order_Details
  VALUES (926, 25, 134.83, 6);
INSERT INTO Order_Details
  VALUES (926, 30, 45, 2);
INSERT INTO Order_Details
  VALUES (926, 35, 37.83, 5);
INSERT INTO Order_Details
  VALUES (926, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (927, 8, 50, 1);
INSERT INTO Order_Details
  VALUES (927, 16, 27.16, 6);
INSERT INTO Order_Details
  VALUES (927, 24, 66.93, 5);
INSERT INTO Order_Details
  VALUES (927, 32, 32, 1);
INSERT INTO Order_Details
  VALUES (927, 40, 174.6, 5);
INSERT INTO Order_Details
  VALUES (928, 7, 47.53, 6);
INSERT INTO Order_Details
  VALUES (928, 17, 43.65, 5);
INSERT INTO Order_Details
  VALUES (928, 27, 24, 1);
INSERT INTO Order_Details
  VALUES (928, 37, 183.33, 5);
INSERT INTO Order_Details
  VALUES (929, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (929, 14, 139.95, 1);
INSERT INTO Order_Details
  VALUES (929, 36, 160.05, 6);
INSERT INTO Order_Details
  VALUES (930, 20, 15, 1);
INSERT INTO Order_Details
  VALUES (931, 20, 15, 3);
INSERT INTO Order_Details
  VALUES (931, 40, 180, 1);
INSERT INTO Order_Details
  VALUES (932, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (932, 17, 45, 2);
INSERT INTO Order_Details
  VALUES (932, 30, 45, 4);
INSERT INTO Order_Details
  VALUES (933, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (933, 27, 24, 2);
INSERT INTO Order_Details
  VALUES (934, 7, 49, 2);
INSERT INTO Order_Details
  VALUES (934, 15, 4.84, 6);
INSERT INTO Order_Details
  VALUES (934, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (934, 39, 175, 4);
INSERT INTO Order_Details
  VALUES (935, 1, 1200, 3);
INSERT INTO Order_Details
  VALUES (935, 11, 1650, 1);
INSERT INTO Order_Details
  VALUES (935, 22, 82, 2);
INSERT INTO Order_Details
  VALUES (935, 32, 32, 3);
INSERT INTO Order_Details
  VALUES (936, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (936, 9, 33, 4);
INSERT INTO Order_Details
  VALUES (936, 20, 15, 1);
INSERT INTO Order_Details
  VALUES (936, 28, 29, 2);
INSERT INTO Order_Details
  VALUES (936, 36, 165, 1);
INSERT INTO Order_Details
  VALUES (937, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (937, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (937, 13, 67.5, 1);
INSERT INTO Order_Details
  VALUES (937, 19, 47, 1);
INSERT INTO Order_Details
  VALUES (937, 31, 22, 3);
INSERT INTO Order_Details
  VALUES (937, 37, 189, 1);
INSERT INTO Order_Details
  VALUES (938, 1, 1164, 5);
INSERT INTO Order_Details
  VALUES (938, 7, 49, 3);
INSERT INTO Order_Details
  VALUES (938, 13, 67.5, 2);
INSERT INTO Order_Details
  VALUES (938, 19, 45.59, 6);
INSERT INTO Order_Details
  VALUES (938, 31, 22, 4);
INSERT INTO Order_Details
  VALUES (939, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (939, 14, 139.95, 2);
INSERT INTO Order_Details
  VALUES (939, 22, 79.54, 5);
INSERT INTO Order_Details
  VALUES (939, 30, 43.65, 6);
INSERT INTO Order_Details
  VALUES (939, 38, 166, 2);
INSERT INTO Order_Details
  VALUES (940, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (940, 6, 635, 2);
INSERT INTO Order_Details
  VALUES (940, 11, 1650, 4);
INSERT INTO Order_Details
  VALUES (940, 16, 28, 4);
INSERT INTO Order_Details
  VALUES (940, 21, 55, 2);
INSERT INTO Order_Details
  VALUES (940, 26, 121.25, 5);
INSERT INTO Order_Details
  VALUES (940, 34, 26.19, 6);
INSERT INTO Order_Details
  VALUES (940, 39, 169.75, 6);
INSERT INTO Order_Details
  VALUES (941, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (941, 6, 635, 1);
INSERT INTO Order_Details
  VALUES (941, 11, 1650, 2);
INSERT INTO Order_Details
  VALUES (941, 16, 28, 2);
INSERT INTO Order_Details
  VALUES (941, 29, 34, 3);
INSERT INTO Order_Details
  VALUES (941, 34, 27, 2);
INSERT INTO Order_Details
  VALUES (941, 39, 169.75, 5);
INSERT INTO Order_Details
  VALUES (942, 1, 1200, 2);
INSERT INTO Order_Details
  VALUES (942, 14, 135.75, 6);
INSERT INTO Order_Details
  VALUES (942, 38, 166, 4);
INSERT INTO Order_Details
  VALUES (943, 1, 1200, 1);
INSERT INTO Order_Details
  VALUES (943, 9, 33, 1);
INSERT INTO Order_Details
  VALUES (943, 17, 45, 1);
INSERT INTO Order_Details
  VALUES (943, 26, 121.25, 6);
INSERT INTO Order_Details
  VALUES (943, 34, 27, 2);
INSERT INTO Order_Details
  VALUES (944, 1, 1164, 6);
INSERT INTO Order_Details
  VALUES (944, 9, 33, 3);
INSERT INTO Order_Details
  VALUES (944, 17, 43.65, 6);
INSERT INTO Order_Details
  VALUES (944, 32, 32, 2);
INSERT INTO Order_Details
  VALUES (944, 40, 180, 2);
INSERT INTO Product_Vendors
  VALUES (1, 4, 804, 6);
INSERT INTO Product_Vendors
  VALUES (1, 9, 854.22, 7);
INSERT INTO Product_Vendors
  VALUES (2, 6, 1269, 9);
INSERT INTO Product_Vendors
  VALUES (2, 9, 1477.81, 7);
INSERT INTO Product_Vendors
  VALUES (3, 7, 54.19, 10);
INSERT INTO Product_Vendors
  VALUES (3, 9, 57.27, 6);
INSERT INTO Product_Vendors
  VALUES (4, 6, 44.22, 10);
INSERT INTO Product_Vendors
  VALUES (4, 9, 41.62, 14);
INSERT INTO Product_Vendors
  VALUES (5, 7, 5.38, 10);
INSERT INTO Product_Vendors
  VALUES (5, 9, 5.87, 9);
INSERT INTO Product_Vendors
  VALUES (6, 2, 403.22, 3);
INSERT INTO Product_Vendors
  VALUES (6, 9, 448.73, 7);
INSERT INTO Product_Vendors
  VALUES (7, 2, 31.12, 3);
INSERT INTO Product_Vendors
  VALUES (8, 8, 39.32, 10);
INSERT INTO Product_Vendors
  VALUES (8, 9, 37.88, 14);
INSERT INTO Product_Vendors
  VALUES (9, 3, 21.53, 4);
INSERT INTO Product_Vendors
  VALUES (10, 2, 22.86, 3);
INSERT INTO Product_Vendors
  VALUES (11, 3, 1076.62, 4);
INSERT INTO Product_Vendors
  VALUES (11, 9, 1178.65, 7);
INSERT INTO Product_Vendors
  VALUES (12, 1, 14.51, 2);
INSERT INTO Product_Vendors
  VALUES (12, 6, 15.44, 10);
INSERT INTO Product_Vendors
  VALUES (12, 9, 15.02, 14);
INSERT INTO Product_Vendors
  VALUES (13, 1, 41.68, 2);
INSERT INTO Product_Vendors
  VALUES (13, 6, 43.99, 10);
INSERT INTO Product_Vendors
  VALUES (13, 9, 43.77, 14);
INSERT INTO Product_Vendors
  VALUES (14, 6, 98.66, 9);
INSERT INTO Product_Vendors
  VALUES (14, 9, 101.22, 14);
INSERT INTO Product_Vendors
  VALUES (15, 4, 3.34, 6);
INSERT INTO Product_Vendors
  VALUES (15, 6, 3.79, 10);
INSERT INTO Product_Vendors
  VALUES (15, 9, 3.88, 14);
INSERT INTO Product_Vendors
  VALUES (16, 4, 18.76, 6);
INSERT INTO Product_Vendors
  VALUES (16, 6, 19.33, 10);
INSERT INTO Product_Vendors
  VALUES (16, 9, 19.33, 14);
INSERT INTO Product_Vendors
  VALUES (17, 1, 27.79, 2);
INSERT INTO Product_Vendors
  VALUES (17, 6, 28.55, 10);
INSERT INTO Product_Vendors
  VALUES (17, 9, 28.55, 14);
INSERT INTO Product_Vendors
  VALUES (18, 2, 113.66, 3);
INSERT INTO Product_Vendors
  VALUES (19, 2, 29.84, 3);
INSERT INTO Product_Vendors
  VALUES (20, 7, 10.84, 10);
INSERT INTO Product_Vendors
  VALUES (20, 9, 11.54, 6);
INSERT INTO Product_Vendors
  VALUES (21, 7, 39.74, 10);
INSERT INTO Product_Vendors
  VALUES (21, 9, 41.5, 9);
INSERT INTO Product_Vendors
  VALUES (22, 10, 63.55, 15);
INSERT INTO Product_Vendors
  VALUES (23, 6, 69.54, 15);
INSERT INTO Product_Vendors
  VALUES (23, 9, 64.39, 14);
INSERT INTO Product_Vendors
  VALUES (24, 6, 55.91, 15);
INSERT INTO Product_Vendors
  VALUES (24, 7, 53.88, 10);
INSERT INTO Product_Vendors
  VALUES (24, 9, 52.27, 14);
INSERT INTO Product_Vendors
  VALUES (25, 9, 105.29, 14);
INSERT INTO Product_Vendors
  VALUES (25, 10, 101.58, 15);
INSERT INTO Product_Vendors
  VALUES (26, 3, 81.56, 4);
INSERT INTO Product_Vendors
  VALUES (26, 6, 79.88, 15);
INSERT INTO Product_Vendors
  VALUES (27, 3, 15.66, 4);
INSERT INTO Product_Vendors
  VALUES (27, 6, 16.88, 10);
INSERT INTO Product_Vendors
  VALUES (27, 9, 15.88, 14);
INSERT INTO Product_Vendors
  VALUES (28, 3, 18.92, 4);
INSERT INTO Product_Vendors
  VALUES (28, 6, 20.56, 10);
INSERT INTO Product_Vendors
  VALUES (28, 9, 19.04, 14);
INSERT INTO Product_Vendors
  VALUES (29, 5, 23.38, 8);
INSERT INTO Product_Vendors
  VALUES (29, 6, 24.44, 10);
INSERT INTO Product_Vendors
  VALUES (29, 9, 23.99, 14);
INSERT INTO Product_Vendors
  VALUES (30, 8, 33.3, 12);
INSERT INTO Product_Vendors
  VALUES (30, 9, 35.32, 8);
INSERT INTO Product_Vendors
  VALUES (30, 10, 32.87, 15);
INSERT INTO Product_Vendors
  VALUES (31, 7, 15.85, 15);
INSERT INTO Product_Vendors
  VALUES (31, 8, 16.28, 12);
INSERT INTO Product_Vendors
  VALUES (31, 9, 16.93, 7);
INSERT INTO Product_Vendors
  VALUES (31, 10, 16.9, 9);
INSERT INTO Product_Vendors
  VALUES (32, 6, 24.77, 15);
INSERT INTO Product_Vendors
  VALUES (32, 7, 24.12, 10);
INSERT INTO Product_Vendors
  VALUES (32, 8, 23.68, 12);
INSERT INTO Product_Vendors
  VALUES (33, 6, 15.23, 15);
INSERT INTO Product_Vendors
  VALUES (33, 8, 14.06, 12);
INSERT INTO Product_Vendors
  VALUES (34, 6, 19.04, 9);
INSERT INTO Product_Vendors
  VALUES (34, 9, 23.86, 3);
INSERT INTO Product_Vendors
  VALUES (34, 10, 19.32, 10);
INSERT INTO Product_Vendors
  VALUES (35, 6, 27.49, 9);
INSERT INTO Product_Vendors
  VALUES (35, 9, 28.22, 6);
INSERT INTO Product_Vendors
  VALUES (36, 6, 122.88, 10);
INSERT INTO Product_Vendors
  VALUES (36, 7, 119.21, 10);
INSERT INTO Product_Vendors
  VALUES (36, 9, 122.78, 14);
INSERT INTO Product_Vendors
  VALUES (37, 2, 120.02, 3);
INSERT INTO Product_Vendors
  VALUES (37, 6, 125.99, 10);
INSERT INTO Product_Vendors
  VALUES (37, 9, 124.89, 14);
INSERT INTO Product_Vendors
  VALUES (38, 9, 136.98, 6);
INSERT INTO Product_Vendors
  VALUES (38, 10, 128.65, 15);
INSERT INTO Product_Vendors
  VALUES (39, 6, 137.55, 7);
INSERT INTO Product_Vendors
  VALUES (39, 7, 126.44, 10);
INSERT INTO Product_Vendors
  VALUES (40, 6, 154.87, 10);
INSERT INTO Product_Vendors
  VALUES (40, 9, 136.35, 14);

CREATE DATABASE SchoolSchedulingExample;

use SchoolSchedulingExample;

CREATE TABLE Buildings (
	BuildingCode nvarchar (3) NOT NULL ,
	BuildingName nvarchar (25) NULL ,
	NumberOfFloors smallint NULL ,
	ElevatorAccess tinyint(1) NOT NULL ,
	SiteParkingAvailable tinyint(1) NOT NULL 
);

CREATE TABLE Categories (
	CategoryID nvarchar (10) NOT NULL ,
	CategoryDescription nvarchar (75) NULL ,
	DepartmentID smallint NULL 
);

CREATE TABLE Class_Rooms (
	ClassRoomID smallint NOT NULL ,
	BuildingCode nvarchar (3) NULL ,
	PhoneAvailable tinyint(1) NOT NULL 
);

CREATE TABLE Classes (
	ClassID smallint NOT NULL ,
	SubjectID smallint NULL ,
	ClassRoomID smallint NULL ,
	Credits smallint NULL ,
	StartTime time NULL ,
	Duration real NULL ,
	MondaySchedule tinyint(1) NOT NULL ,
	TuesdaySchedule tinyint(1) NOT NULL ,
	WednesdaySchedule tinyint(1) NOT NULL ,
	ThursdaySchedule tinyint(1) NOT NULL ,
	FridaySchedule tinyint(1) NOT NULL ,
	SaturdaySchedule tinyint(1) NOT NULL
);

CREATE TABLE Faculty (
	StaffID int NOT NULL ,
	Title nvarchar (50) NULL ,
	Status nvarchar (12) NULL ,
	Tenured tinyint(1) NOT NULL 
);

CREATE TABLE Faculty_Categories (
	StaffID int NOT NULL ,
	CategoryID nvarchar (10) NOT NULL 
);

CREATE TABLE Faculty_Classes (
	ClassID smallint NOT NULL ,
	StaffID int NOT NULL 
);

CREATE TABLE Faculty_Subjects (
	StaffID int NOT NULL ,
	SubjectID smallint NOT NULL ,
	ProficiencyRating real NULL
);

CREATE TABLE Staff (
	StaffID int NOT NULL ,
	StfFirstName nvarchar (25) NULL ,
	StfLastname nvarchar (25) NULL ,
	StfStreetAddress nvarchar (50) NULL ,
	StfCity nvarchar (30) NULL ,
	StfState nvarchar (2) NULL ,
	StfZipCode nvarchar (5) NULL ,
	StfAreaCode nvarchar (5) NULL ,
	StfPhoneNumber nvarchar (8) NULL ,
	Salary decimal(15,2) NULL ,
	DateHired datetime NULL ,
	Position nvarchar (50) NULL 
);

CREATE TABLE Student_Class_Status (
	ClassStatus smallint NOT NULL ,
	ClassStatusDescription nvarchar (50) NULL 
);

CREATE TABLE Student_Schedules (
	StudentID int NOT NULL ,
	ClassID smallint NOT NULL ,
	ClassStatus smallint NULL ,
	Grade real NULL
);

CREATE TABLE Students (
	StudentID int NOT NULL ,
	StudFirstName nvarchar (25) NULL ,
	StudLastName nvarchar (25) NULL ,
	StudStreetAddress nvarchar (50) NULL ,
	StudCity nvarchar (30) NULL ,
	StudState nvarchar (2) NULL ,
	StudZipCode nvarchar (5) NULL ,
	StudAreaCode nvarchar (5) NULL ,
	StudPhoneNumber nvarchar (8) NULL 
);

CREATE TABLE Subjects (
	SubjectID smallint NOT NULL ,
	CategoryID nvarchar (10) NULL ,
	SubjectCode nvarchar (8) NULL ,
	SubjectName nvarchar (50) NULL ,
	SubjectDescription text NULL
);

ALTER TABLE Buildings ADD CONSTRAINT Buildings_PK PRIMARY KEY (BuildingCode);

CREATE  UNIQUE  INDEX BuildingNumber ON Buildings(BuildingCode);

CREATE  INDEX NumberOfFloors ON Buildings(NumberOfFloors);

ALTER TABLE Categories ADD CONSTRAINT Categories2_PK PRIMARY KEY (CategoryID);

CREATE  INDEX CategoryID ON Categories(CategoryID);

CREATE  INDEX DepartmentID ON Categories(DepartmentID);

ALTER TABLE Class_Rooms ADD CONSTRAINT Class_Rooms_PK PRIMARY KEY (ClassRoomID);

CREATE  INDEX BuildingNumber ON Class_Rooms(BuildingCode);

CREATE  INDEX BuildingsClassRooms ON Class_Rooms(BuildingCode);

CREATE  UNIQUE  INDEX RoomNumber ON Class_Rooms(ClassRoomID);

ALTER TABLE Classes ADD CONSTRAINT Classes_PK PRIMARY KEY (ClassID);

CREATE  INDEX ClassesCategoryID ON Classes(SubjectID);

CREATE  UNIQUE  INDEX ClassID ON Classes(ClassID);

CREATE  INDEX ClassRoomID ON Classes(ClassRoomID);

CREATE  INDEX ClassRoomsClasses ON Classes(ClassRoomID);

CREATE  INDEX SubjectsClasses ON Classes(SubjectID);

ALTER TABLE Faculty ADD CONSTRAINT Faculty_PK PRIMARY KEY (StaffID);

CREATE  UNIQUE  INDEX StaffFaculty ON Faculty(StaffID);

ALTER TABLE Faculty_Categories ADD CONSTRAINT Faculty_Categories_PK PRIMARY KEY (StaffID, CategoryID);

CREATE  INDEX CategoriesFaculty_Categories ON Faculty_Categories(CategoryID);

CREATE  INDEX FacultyFaculty_Categories ON Faculty_Categories(StaffID);

ALTER TABLE Faculty_Classes ADD CONSTRAINT Faculty_Classes_PK PRIMARY KEY (ClassID, StaffID);

CREATE  INDEX ClassesFacultyClasses ON Faculty_Classes(ClassID);

CREATE  INDEX StaffFacultyClasses ON Faculty_Classes(StaffID);

ALTER TABLE Faculty_Subjects ADD CONSTRAINT Faculty_Subjects_PK PRIMARY KEY (StaffID, SubjectID);

CREATE  INDEX FacultyFacultySubjects ON Faculty_Subjects(StaffID);

CREATE  INDEX SubjectsFacultySubjects ON Faculty_Subjects(SubjectID);

ALTER TABLE Staff ADD CONSTRAINT Staff_PK PRIMARY KEY (StaffID);

CREATE  UNIQUE  INDEX StaffID ON Staff(StaffID);

CREATE  INDEX StaffZipCode ON Staff(StfZipCode);

CREATE  INDEX StudAreaCode ON Staff(StfAreaCode);

ALTER TABLE Student_Class_Status ADD CONSTRAINT Student_Class_Status_PK PRIMARY KEY (ClassStatus);

ALTER TABLE Student_Schedules ADD CONSTRAINT Student_Schedules_PK PRIMARY KEY (StudentID, ClassID);

CREATE  INDEX ClassesStudent_Schedules ON Student_Schedules(ClassID);

CREATE  INDEX Student_Class_StatusStudent_Schedules ON Student_Schedules(ClassStatus);

CREATE  INDEX StudentsStudent_Schedules ON Student_Schedules(StudentID);

ALTER TABLE Students ADD CONSTRAINT aaaaaStudents_PK PRIMARY KEY (StudentID);

CREATE  INDEX StudAreaCode ON Students(StudAreaCode);

CREATE  UNIQUE  INDEX StudentID ON Students(StudentID);

ALTER TABLE Subjects ADD CONSTRAINT Subjects_PK PRIMARY KEY (SubjectID);

CREATE  INDEX CategoriesSubjects ON Subjects(CategoryID);

CREATE  INDEX CategoryID ON Subjects(CategoryID);

CREATE  UNIQUE  INDEX SubjectCode ON Subjects(SubjectCode);

CREATE  INDEX SubjectID ON Subjects(SubjectID);

ALTER TABLE Class_Rooms ADD CONSTRAINT Class_Rooms_FK00 FOREIGN KEY (BuildingCode) REFERENCES Buildings (BuildingCode);

ALTER TABLE Classes ADD CONSTRAINT Classes_FK00 FOREIGN KEY (ClassRoomID) REFERENCES Class_Rooms (ClassRoomID);

ALTER TABLE Classes ADD CONSTRAINT Classes_FK01 FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID);

ALTER TABLE Faculty ADD CONSTRAINT Faculty_FK00 FOREIGN KEY (StaffID) REFERENCES Staff (StaffID);

ALTER TABLE Faculty_Categories ADD CONSTRAINT Faculty_Categories_FK00 FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID);

ALTER TABLE Faculty_Categories ADD CONSTRAINT Faculty_Categories_FK01 FOREIGN KEY (StaffID) REFERENCES Faculty (StaffID);

ALTER TABLE Faculty_Classes ADD CONSTRAINT Faculty_Classes_FK00 FOREIGN KEY (ClassID) REFERENCES Classes (ClassID);

ALTER TABLE Faculty_Classes ADD CONSTRAINT Faculty_Classes_FK01 FOREIGN KEY (StaffID) REFERENCES Staff (StaffID);

ALTER TABLE Faculty_Subjects ADD CONSTRAINT Faculty_Subjects_FK00 FOREIGN KEY (StaffID) REFERENCES Faculty (StaffID);

ALTER TABLE Faculty_Subjects ADD CONSTRAINT Faculty_Subjects_FK01 FOREIGN KEY (
SubjectID) REFERENCES Subjects (SubjectID);

ALTER TABLE Student_Schedules ADD CONSTRAINT Student_Schedules_FK00 FOREIGN KEY (ClassID) REFERENCES Classes (ClassID);

ALTER TABLE Student_Schedules ADD CONSTRAINT Student_Schedules_FK01 FOREIGN KEY (ClassStatus) REFERENCES Student_Class_Status (ClassStatus);

ALTER TABLE Student_Schedules ADD CONSTRAINT Student_Schedules_FK02 FOREIGN KEY (StudentID) REFERENCES Students (StudentID);

ALTER TABLE Subjects ADD CONSTRAINT Subjects_FK00 FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID);

USE SchoolSchedulingExample;
INSERT INTO Staff
  VALUES (98005, 'Suzanne', 'Viescas', '15127 NE 24th, #383', 
   'Redmond', 'WA', '98052', '425', '555-2686', 44000, 
   Cast('1986-05-31' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98007, 'Gary', 'Hallmark', 'Route 2, Box 203B', 
   'Auburn', 'WA', '98002', '253', '555-2676', 53000, 
   Cast('1985-01-21' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98010, 'Jeffrey', 'Smith', '30301 - 166th Ave. N.E.', 
   'Fremont', 'CA', '94538', '510', '555-2596', 52000, 
   Cast('1983-10-06' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98011, 'Ann', 'Patterson', '16 Maple Lane', 
   'Auburn', 'WA', '98002', '253', '555-2591', 45000, 
   Cast('1983-10-16' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98012, 'Robert', 'Brown', '672 Lamont Ave', 
   'Houston', 'TX', '77201', '713', '555-2491', 49000, 
   Cast('1989-02-09' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98013, 'Deb', 'Waldal', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', '253', '555-2496', 44000, 
   Cast('1986-07-05' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98014, 'Peter', 'Brehm', '722 Moss Bay Blvd.', 
   'Kirkland', 'WA', '98033', '425', '555-2501', 60000, 
   Cast('1986-07-16' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98019, 'Mariya', 'Sergienko', '901 Pine Avenue', 
   'Portland', 'OR', '97208', '503', '555-2526', 45000, 
   Cast('1989-11-02' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98020, 'Jim', 'Glynn', '13920 S.E. 40th Street', 
   'Bellevue', 'WA', '98009', '425', '555-2531', 45000, 
   Cast('1985-08-02' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98021, 'Tim', 'Smith', '30301 - 166th Ave. N.E.', 
   'Seattle', 'WA', '98106', '206', '555-2536', 40000, 
   Cast('1988-12-17' As DATE), 'Registrar');
INSERT INTO Staff
  VALUES (98025, 'Carol', 'Viescas', '722 Moss Bay Blvd.', 
   'Kirkland', 'WA', '98033', '425', '555-2576', 50000, 
   Cast('1984-04-12' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98028, 'Alaina', 'Hallmark', 'Route 2, Box 203B', 
   'Woodinville', 'WA', '98072', '425', '555-2631', 
   57000, Cast('1984-01-17' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98030, 'Liz', 'Keyser', '13920 S.E. 40th Street', 
   'Bellevue', 'WA', '98006', '425', '555-2556', 48000, 
   Cast('1988-05-31' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98036, 'Sam', 'Abolrous', '611 Alpine Drive', 
   'Palm Springs', 'CA', '92263', '760', '555-2611', 
   60000, Cast('1982-11-20' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98040, 'Jim', 'Wilson', '101 NE 88th', 'Salem', 
   'OR', '97301', '503', '555-2636', 50000, Cast('1987-01-13' As DATE), 
   'Faculty');
INSERT INTO Staff
  VALUES (98042, 'David', 'Smith', '311 20th Ave. N.E.', 
   'Fremont', 'CA', '94538', '510', '555-2646', 52000, 
   Cast('1991-12-17' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98043, 'Kathryn', 'Patterson', '16 Maple Lane', 
   'Seattle', 'WA', '98115', '206', '555-2651', 25000, 
   Cast('1984-11-14' As DATE), 'Secretary');
INSERT INTO Staff
  VALUES (98045, 'Michael', 'Hernandez', 'PO Box 223311', 
   'Tacoma', 'WA', '98413', '253', '555-2711', 60000, 
   Cast('1990-08-20' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98048, 'Joyce', 'Bonnicksen', '2424 Thames Drive', 
   'Bellevue', 'WA', '98006', '425', '555-2726', 60000, 
   Cast('1986-03-02' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98052, 'Katherine', 'Ehrlich', '777 Fenexet Blvd', 
   'Redmond', 'WA', '98052', '425', '555-0399', 45000, 
   Cast('1985-03-08' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98053, 'Caleb', 'Viescas', '4501 Wetland Road', 
   'Long Beach', 'CA', '90809', '562', '555-0037', 
   45000, Cast('1992-02-10' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98055, 'Alastair', 'Black', '3887 Easy Street', 
   'Seattle', 'WA', '98125', '206', '555-0039', 60000, 
   Cast('1988-12-11' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98057, 'Joe', 'Rosales III', '7288 Barrister Ave N', 
   'Tacoma', 'WA', '98413', '253', '555-2281', 35000, 
   Cast('1988-11-25' As DATE), 'Graduate Advisor');
INSERT INTO Staff
  VALUES (98059, 'Maria', 'Patterson', '3445 Cheyenne Road', 
   'El Paso', 'TX', '79993', '915', '555-2291', 48000, 
   Cast('1986-09-17' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98062, 'Caroline', 'Coie', '298 Forest Lane', 
   'Seattle', 'WA', '98125', '206', '555-2306', 52000, 
   Cast('1983-01-28' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98063, 'Kirk', 'DeGrasse', '455 West Palm Ave', 
   'San Antonio', 'TX', '78284', '210', '555-2311', 
   45000, Cast('1988-03-02' As DATE), 'Faculty');
INSERT INTO Staff
  VALUES (98064, 'Luke', 'Patterson', '877 145th Ave SE', 
   'Portland', 'OR', '97208', '503', '555-2316', 56000, 
   Cast('1989-08-20' As DATE), 'Faculty');
INSERT INTO Students
  VALUES (1001, 'Kerry', 'Patterson', '9877 Hacienda Drive', 
   'San Antonio', 'TX', '78284', '210', '555-2706');
INSERT INTO Students
  VALUES (1002, 'David', 'Hamilton', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', '253', '555-2701');
INSERT INTO Students
  VALUES (1003, 'Betsy', 'Stadick', '611 Alpine Drive', 
   'Palm Springs', 'CA', '92263', '760', '555-2696');
INSERT INTO Students
  VALUES (1004, 'Janice', 'Galvin', '4110 Old Redmond Rd.', 
   'Redmond', 'WA', '98052', '425', '555-2691');
INSERT INTO Students
  VALUES (1005, 'Doris', 'Hartwig', '4726 - 11th Ave. N.E.', 
   'Seattle', 'WA', '98105', '206', '555-2671');
INSERT INTO Students
  VALUES (1006, 'Scott', 'Bishop', '66 Spring Valley Drive', 
   'Medford', 'OR', '97501', '541', '555-2666');
INSERT INTO Students
  VALUES (1007, 'Elizabeth', 'Hallmark', 'Route 2, Box 203B', 
   'Auburn', 'WA', '98002', '253', '555-2521');
INSERT INTO Students
  VALUES (1008, 'Sara', 'Sheskey', '16679 NE 41st Court', 
   'Portland', 'OR', '97208', '503', '555-2566');
INSERT INTO Students
  VALUES (1009, 'Karen', 'Smith', '30301 - 166th Ave. N.E.', 
   'Eugene', 'OR', '97401', '541', '555-2551');
INSERT INTO Students
  VALUES (1010, 'Marianne', 'Wier', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', '253', '555-2606');
INSERT INTO Students
  VALUES (1011, 'John', 'Kennedy', '16679 NE 41st Court', 
   'Portland', 'OR', '97208', '503', '555-2621');
INSERT INTO Students
  VALUES (1012, 'Sarah', 'Thompson', '2222 Springer Road', 
   'Lubbock', 'TX', '79402', '806', '555-2626');
INSERT INTO Students
  VALUES (1013, 'Michael', 'Viescas', '15127 NE 24th, #383', 
   'Redmond', 'WA', '98052', '425', '555-2656');
INSERT INTO Students
  VALUES (1014, 'Kendra', 'Bonnicksen', '12330 Larchlemont Lane', 
   'Seattle', 'WA', '98105', '206', '555-2716');
INSERT INTO Students
  VALUES (1015, 'Brannon', 'Jones', '777 Fenexet Blvd', 
   'Long Beach', 'CA', '90809', '562', '555-0399');
INSERT INTO Students
  VALUES (1016, 'Steve', 'Pundt', '2500 Rosales Lane', 
   'Dallas', 'TX', '79915', '972', '555-9938');
INSERT INTO Students
  VALUES (1017, 'George', 'Chavez', '281 Old Navy Road', 
   'Bremerton', 'WA', '98310', '360', '555-9930');
INSERT INTO Students
  VALUES (1018, 'Richard', 'Lum', '754 Fourth Ave', 
   'Seattle', 'WA', '98115', '206', '555-2296');
INSERT INTO Student_Class_Status
  VALUES (1, 'Enrolled');
INSERT INTO Student_Class_Status
  VALUES (2, 'Completed');
INSERT INTO Student_Class_Status
  VALUES (3, 'Withdrew');
INSERT INTO Categories
  VALUES ('ACC', 'Accounting', 1);
INSERT INTO Categories
  VALUES ('ART', 'Art', 3);
INSERT INTO Categories
  VALUES ('BIO', 'Biology', 2);
INSERT INTO Categories
  VALUES ('BUS', 'Business', 1);
INSERT INTO Categories
  VALUES ('CHE', 'Chemistry', 2);
INSERT INTO Categories
  VALUES ('CIS', 'Computer Information Systems', 5);
INSERT INTO Categories
  VALUES ('CSC', 'Computer Science', 5);
INSERT INTO Categories
  VALUES ('ECO', 'Economics', 4);
INSERT INTO Categories
  VALUES ('ENG', 'English', 3);
INSERT INTO Categories
  VALUES ('FRE', 'French', 3);
INSERT INTO Categories
  VALUES ('GEG', 'Geography', 4);
INSERT INTO Categories
  VALUES ('GER', 'German', 3);
INSERT INTO Categories
  VALUES ('HIS', 'History', 4);
INSERT INTO Categories
  VALUES ('JRN', 'Journalism', 1);
INSERT INTO Categories
  VALUES ('MAT', 'Math', 2);
INSERT INTO Categories
  VALUES ('MUS', 'Music', 3);
INSERT INTO Categories
  VALUES ('PHY', 'Physics', 2);
INSERT INTO Categories
  VALUES ('POL', 'Political Science', 4);
INSERT INTO Categories
  VALUES ('PSY', 'Psychology', 4);
INSERT INTO Buildings
  VALUES ('AS', 'Arts and Sciences', 3, 1, 1);
INSERT INTO Buildings
  VALUES ('CC', 'College Center', 3, 1, 0);
INSERT INTO Buildings
  VALUES ('GYM', 'PE and Wellness', 1, 0, 1);
INSERT INTO Buildings
  VALUES ('IB', 'Instructional Building', 3, 1, 1);
INSERT INTO Buildings
  VALUES ('LB', 'Library', 2, 1, 1);
INSERT INTO Buildings
  VALUES ('TB', 'Technology Building', 2, 1, 1);
INSERT INTO Class_Rooms
  VALUES (1131, 'LB', 1);
INSERT INTO Class_Rooms
  VALUES (1142, 'LB', 0);
INSERT INTO Class_Rooms
  VALUES (1231, 'LB', 1);
INSERT INTO Class_Rooms
  VALUES (1514, 'AS', 1);
INSERT INTO Class_Rooms
  VALUES (1515, 'AS', 1);
INSERT INTO Class_Rooms
  VALUES (1519, 'AS', 0);
INSERT INTO Class_Rooms
  VALUES (1525, 'AS', 1);
INSERT INTO Class_Rooms
  VALUES (1530, 'AS', 1);
INSERT INTO Class_Rooms
  VALUES (1532, 'AS', 0);
INSERT INTO Class_Rooms
  VALUES (1619, 'AS', 0);
INSERT INTO Class_Rooms
  VALUES (1622, 'AS', 1);
INSERT INTO Class_Rooms
  VALUES (1624, 'AS', 0);
INSERT INTO Class_Rooms
  VALUES (1627, 'AS', 0);
INSERT INTO Class_Rooms
  VALUES (1639, 'TB', 1);
INSERT INTO Class_Rooms
  VALUES (2357, 'CC', 1);
INSERT INTO Class_Rooms
  VALUES (2408, 'IB', 0);
INSERT INTO Class_Rooms
  VALUES (2423, 'IB', 0);
INSERT INTO Class_Rooms
  VALUES (3305, 'IB', 1);
INSERT INTO Class_Rooms
  VALUES (3307, 'IB', 0);
INSERT INTO Class_Rooms
  VALUES (3309, 'IB', 0);
INSERT INTO Class_Rooms
  VALUES (3313, 'IB', 0);
INSERT INTO Class_Rooms
  VALUES (3315, 'IB', 0);
INSERT INTO Class_Rooms
  VALUES (3317, 'IB', 1);
INSERT INTO Class_Rooms
  VALUES (3319, 'IB', 0);
INSERT INTO Class_Rooms
  VALUES (3322, 'IB', 0);
INSERT INTO Class_Rooms
  VALUES (3330, 'IB', 1);
INSERT INTO Class_Rooms
  VALUES (3343, 'CC', 0);
INSERT INTO Class_Rooms
  VALUES (3345, 'CC', 0);
INSERT INTO Class_Rooms
  VALUES (3346, 'CC', 1);
INSERT INTO Class_Rooms
  VALUES (3352, 'CC', 1);
INSERT INTO Class_Rooms
  VALUES (3353, 'CC', 0);
INSERT INTO Class_Rooms
  VALUES (3355, 'CC', 0);
INSERT INTO Class_Rooms
  VALUES (3404, 'IB', 0);
INSERT INTO Class_Rooms
  VALUES (3406, 'IB', 1);
INSERT INTO Class_Rooms
  VALUES (3409, 'IB', 1);
INSERT INTO Class_Rooms
  VALUES (3415, 'IB', 1);
INSERT INTO Class_Rooms
  VALUES (3420, 'IB', 0);
INSERT INTO Class_Rooms
  VALUES (3422, 'IB', 1);
INSERT INTO Class_Rooms
  VALUES (3431, 'IB', 0);
INSERT INTO Class_Rooms
  VALUES (3443, 'CC', 0);
INSERT INTO Class_Rooms
  VALUES (3445, 'CC', 1);
INSERT INTO Class_Rooms
  VALUES (3446, 'CC', 0);
INSERT INTO Class_Rooms
  VALUES (3452, 'CC', 0);
INSERT INTO Class_Rooms
  VALUES (3455, 'CC', 1);
INSERT INTO Subjects
  VALUES (1, 'ACC', 'ACC 210', 'Financial Accounting Fundamentals I', 
   'Introduces basic accounting concepts, principles and prodcedures for recording business transactions and developing financial accounting reports. Excel spreadsheet component.');
INSERT INTO Subjects
  VALUES (2, 'ACC', 'ACC 220', 'Financial Accounting Fundamentals II', 
   'Applications of basic accounting concepts, principles and procedures to more complex business situations and to different forms of enterprise ownership. Includes computerized element. Prereq: ACC 210 or instructor permission.');
INSERT INTO Subjects
  VALUES (3, 'ACC', 'ACC 230', 'Fundamentals of Managerial Accounting', 
   'Analysis of accounting data as part of the managerial process of planning, decision making and control. Concentrates on economic decision making in enterprises. Includes computerized element. Prereq: ACC 220 or instructor permission.');
INSERT INTO Subjects
  VALUES (4, 'ACC', 'ACC 251', 'Intermediate Accounting', 
   'In-depth review of financial accounting principles. Emphasizes the conceptual framework of accounting, revenue and expense recognition. Accounts Receivable, Depreciation, and Amortization, etc. Prereq: ACC 220 or instructor permission.');
INSERT INTO Subjects
  VALUES (5, 'ACC', 'ACC 257', 'Business Tax Accounting', 
   'Basic principles, practices and governmental regulations (Federal, Washington, State, and local) involved in business tax accounting including filing returns, record keeping, tax planning, and registrations and business licenses. Prereq: ACC 220 or instructors permissions.');
INSERT INTO Subjects
  VALUES (6, 'BUS', 'BUS 101', 'Introduction to Business', 
   'Survey of businss practices. Covers business terminology, forms of business ownership, franchising, small and international businesses, leadership and management, marketing principles, financing and investment methods, and business environment.');
INSERT INTO Subjects
  VALUES (7, 'BUS', 'BUS 155', 'Developing A Feasibility Plan', 
   'With the aid of a counselor, a feasibility plan will be developed which will be the basis or start of your business plan. Must be concurrently enrolled in BUS 151.');
INSERT INTO Subjects
  VALUES (8, 'BUS', 'BUS 151', 'Introduction to Entrepreneurship', 
   'Overview of the entrepreneurial process, examination of the marketplace, and discussion of successful business strategies. Product selection, selling and marketing strategies. Sources of information and assistance. Must be concurrently enrolled in BUS 155.');
INSERT INTO Subjects
  VALUES (9, 'BUS', 'BUS 170', 'Information Technology I', 
   'Uses Word for Windows word processing skills, document formatting, keyboarding, and 10-key keypad skills. Emphasis on preparing letters, memos, reports, and tables. Introduces Excel spreadsheet basics.');
INSERT INTO Subjects
  VALUES (10, 'BUS', 'BUS 171', 'Information Technology II', 
   'Uses intermediate Word features including formatting and production, mail merge, macros, text columns, graphics, and fonts; Excel spreadsheet; and introduction to PowerPoint presentation software, Internet and email. Prereq: BUS 170 or permission from instructor.');
INSERT INTO Subjects
  VALUES (11, 'ART', 'ART 100', 'Introduction to Art', 
   'Historical backgrounds and design fundamentals which have affected art. Includes slide lectures, reading and practical studio applications.');
INSERT INTO Subjects
  VALUES (12, 'ART', 'ART 101', 'Design', 'Studio sudies in the fundamentals of two-dimensional art with problems based on line, space, texture, shape and color theories. Includes practical applications of these theories to design.');
INSERT INTO Subjects
  VALUES (13, 'ART', 'ART 111', 'Drawing', 'Study of line, value, space, perspective, and compostion through the use o charcoal, pencil, pen, and brush.');
INSERT INTO Subjects
  VALUES (14, 'ART', 'ART 201', 'Painting', 'Beginning painting in oil or synthetic media using still life. Emphasis on basics such as composition, value studies, color mixing, canvas preparation, and various styles and techniques. No prerequisite; some drawing background important.');
INSERT INTO Subjects
  VALUES (15, 'ART', 'ART 210', 'Computer Art', 'Explore the elements of art such as line, value, space, composition, and color through the use of the computer. Sudents will create works of art using the computer.');
INSERT INTO Subjects
  VALUES (16, 'ART', 'ART 251', 'Art History', 'Surveys major forms of visual expression from the Paleolithic, Egyptian, Mesopotamian, Greek, Roman, and Early Christian periods. Includes painting, sculpture, architecture, lectures, slides, and readings.');
INSERT INTO Subjects
  VALUES (17, 'BIO', 'BIO 100', 'Biological Principles', 
   'An introductory biology course with lab for the non-science major. May include maintenance of the balance between man and his environment, nutrition, genetics and inheritence, ecological principles, plant and animal diversity, and evolution.');
INSERT INTO Subjects
  VALUES (18, 'BIO', 'BIO 101', 'General Biology', 
   'Basic bilogical concepts with emphasis on general cell processes, plant and animal diversity, morphyology, limited reproduction, phylogeny of the living organisms, exploration of molecular genetics.');
INSERT INTO Subjects
  VALUES (19, 'BIO', 'BIO 280', 'Microbiology', 'Introduction to micro-organisms including microbial cell structure and function; metabolism; microbial genetics; and the role of micro-organisms in disease, immunity, and other selected applied areas.');
INSERT INTO Subjects
  VALUES (20, 'CHE', 'CHE 101', 'Chemistry', 'General chemistry for non-science majors. Completion of CHE 101 fulfills chemistry requirements for many health science majors.');
INSERT INTO Subjects
  VALUES (21, 'CHE', 'CHE 139', 'Fundamentals of Chemistry', 
   'Prepatory for the science major chemistry courses for students without prior chemistry experience. This lecture format will include chemical mathematics, basic atomic structure, chemical bonding, chemical equation balancing and mole concept, and chemical stoichiometry.');
INSERT INTO Subjects
  VALUES (22, 'CHE', 'CHE 231', 'Organic Chemistry', 
   'Structure, nomenclature, reactions, and synthesis of the main types of organic compounds.');
INSERT INTO Subjects
  VALUES (23, 'CIS', 'CIS 101', 'Microcomputer Applications', 
   'This is a "hands-on" course. Students will learn how to use word processing, spreadsheet, and database applications. General operation systems activities such as deleting files, renaming files, and creating and navigating directory structures will also be covered.');
INSERT INTO Subjects
  VALUES (24, 'CIS', 'CIS 102', 'Information Systems Concepts', 
   'Provides a broad introduction to computers and information systems. Includes coverage of hardware, software, data organization, data communications, and systems development. Also covers the evolving role of computers in society.');
INSERT INTO Subjects
  VALUES (25, 'CIS', 'CIS 114', 'Problem Solving and Structured Programming', 
   'Covers design, documentation, and coding of programs using top-down design and structured programming principles. Includes introduction to multi-user systems, text editors, data access and storage techniques.');
INSERT INTO Subjects
  VALUES (26, 'CIS', 'CIS 236', 'Database Management', 
   'Includes database concepts, data management techniques, database environment, record relationships, and advantages and limitations of the database approach. Includes data modeling and database design.');
INSERT INTO Subjects
  VALUES (27, 'CSC', 'CSC 110', 'Programming in BASIC', 
   'Computer programming and program design using the Visual Basic programming language. Emphasis is on Program Design and Algorithm Development while writing programs primarily about mathematical and scientific applications.');
INSERT INTO Subjects
  VALUES (28, 'CSC', 'CIS 142', 'Computer Programming', 
   'Introduction to computer science using the C programming language. Emphasizes design, algorithmics, abstraction, and analysis.');
INSERT INTO Subjects
  VALUES (29, 'JRN', 'JRN 104', 'College Publications', 
   'Hands-on course in college publishing. Covers basics of reporting and writing through work on college newspaper and other assignments.');
INSERT INTO Subjects
  VALUES (30, 'ECO', 'ECO 100', 'Survey of Economics', 
   'Economics applied to various comtemporary social problems and issues. Provides an introduction to economic principles concerning national prosperity, market behavior, income inequality, the role of government, and economic fluctuations.');
INSERT INTO Subjects
  VALUES (31, 'ECO', 'ECO 200', 'Principles of Economics: Microeconomics', 
   'Covers resource allocation and income distribution with emphasis on price determination, production costs, and market structures. Intermediate algebra or equivalent required.');
INSERT INTO Subjects
  VALUES (32, 'ECO', 'ECO 201', 'Principles of Economics: Macroeconomics', 
   'Analysis of the aggregate economy: GDP, inflation, business cycles, trade and finance. Intermediate algebra or equivalent required.');
INSERT INTO Subjects
  VALUES (33, 'MUS', 'MUS 100', 'Music in the Western World', 
   'An introduction to music. Features music from a global perspective with a focus on Western Music. Many musical examples, listening, videos on great musicians of the past.');
INSERT INTO Subjects
  VALUES (34, 'MUS', 'MUS 101', 'First Year Theory and Ear Training', 
   'Rudiments of music - notation, scales, intervals, and triads, rhythmic and melodic sight-reading and dictation. Studies of historical periods.');
INSERT INTO Subjects
  VALUES (35, 'MUS', 'MUS 201', 'Second Year Music Theory', 
   'Continuation of MUS 101. Chromatic harmony, modulations and related modern concepts.');
INSERT INTO Subjects
  VALUES (36, 'MUS', 'MUS 204', 'History of Jazz', 
   'Traces the roots of jazz in America from New Orleans, New York, Chicago, Kansas City, the Big Band Era, Be-Bop to modern jazz through films, lectures, recordings and live performances.');
INSERT INTO Subjects
  VALUES (37, 'ENG', 'ENG 101', 'Composition - Fundamentals', 
   'Introduces the nature of the writing process in its various stages: gathering, shaping, establishing audience, editing, revising, polishing, and proffreading. Writing assignments concentrate on the major strategies of nonfiction prose - narration, description, and exposition.');
INSERT INTO Subjects
  VALUES (38, 'ENG', 'ENG 102', 'Composition - Intermediate', 
   'Continues instruction on the writing process, extending it to include source-based writing of the kind typically done in academic settings. Topics for reading and writing will vary instructor to instructor.');
INSERT INTO Subjects
  VALUES (39, 'ENG', 'ENG 104', 'Advanced English Grammar', 
   'Study of the grammar and rhetoric of the English sentence. Not a remedial course.');
INSERT INTO Subjects
  VALUES (40, 'GEG', 'GEG 100', 'Introduction to Geography', 
   'An introduction to the major cultures of the world (Hebrew, Christian, Islamic, Hindu, Buddhist), their origins, values, heroes, rituals, scriptures and cross-cultural influences.');
INSERT INTO Subjects
  VALUES (41, 'GEG', 'GEG 205', 'Physical Geography', 
   'Study of the Earth, the materials that make it up, and plate tectonics. Special attention to the Pacific Northwest. Includes laboratory and field trip work.');
INSERT INTO Subjects
  VALUES (42, 'HIS', 'HIS 101', 'World History to 1500', 
   'Historic foundations and development of the great civilizations from prehistoric days to the Renaissance with emphasis on social, political, economic and geographic aspects. Attention to the nature of history as an intellectual and academic discipline.');
INSERT INTO Subjects
  VALUES (43, 'HIS', 'HIS 111', 'U.S. History to 1877', 
   'American history from the colonial period through Reconstruction. Emphasis on the American Revolution, the National Period, slavery, territorial expansion, the Civil War and Reconstruction.');
INSERT INTO Subjects
  VALUES (44, 'HIS', 'HIS 112', 'U.S. History Since 1865', 
   'Includes Reconstruction, industrialization, urbanization, westward movement, political reform movements, agrarian protest, progressive period, 1920''s Great Depressioin and the New Deal, WWII, the conservative 50''s, liberalism of the 60''s and 70''s, and into the next century.');
INSERT INTO Subjects
  VALUES (45, 'MAT', 'MAT 080', 'Preparatory Mathematics', 
   'Individualized instruction in Arithmetic, Algebra I and II, Geometry, nad Intermediate Algebra.');
INSERT INTO Subjects
  VALUES (46, 'MAT', 'MAT 097', 'Elementary Algebra', 
   'First course in Algebra includes signed numbers, linear equations, linear inequalities, products and factorization of polynomials, and operations with quotients of polynomials.');
INSERT INTO Subjects
  VALUES (47, 'MAT', 'MAT 098', 'Intermediate Algebra', 
   'Sets and the real number system, polynomial and rational expressions, exponents and radicals, first and second degree equations, linear systems of equations, and graphs.');
INSERT INTO Subjects
  VALUES (48, 'MAT', 'MAT 103', 'Geometry and Visualization', 
   'Basic plane geometry concepts, emphasizing problem-solving. Right triangle trigonometry. Introduction to 3-D geometry/spatial thinking. Directed towards students with no high school geometry but who plan a career in science/engineering.');
INSERT INTO Subjects
  VALUES (49, 'MAT', 'MAT 104', 'Trigonometry', 'Elementary plane goemetry, right triangle tirgonometry, general angels, identities, equations, word problems, and selected topics.');
INSERT INTO Subjects
  VALUES (50, 'PHY', 'PHY 100', 'Survey Of Physics', 
   'Basic laws of phyics from the laws of motion through nuclear physics. Also examines the origins and impact on society of the basic physics concepts.');
INSERT INTO Subjects
  VALUES (51, 'PHY', 'PHY 101', 'General Physics', 
   'Classical mechanics; kinematics and dynamics. Includes development of concepts of force, work/energy, impulse/momentum, and the conservation laws.');
INSERT INTO Subjects
  VALUES (52, 'PHY', 'PHY 201', 'Engineering Physics I', 
   'Development of the basic principles of classical mechanics. A calculus approach is used to introduce kinematics, Newton''s laws, the work-energy theorem, and conservation laws.');
INSERT INTO Subjects
  VALUES (53, 'PHY', 'PHY 203', 'Engineering Physics II', 
   'Waves and oscillations. Mechanical waves and sound are studied as well as geometric and physical optics. The wave aspect of an electron is introduced as it applies to the stationary states of the hydrogen atom.');
INSERT INTO Subjects
  VALUES (54, 'POL', 'POL 101', 'Introduction to Political Science', 
   'Introduction to theory, organization, politics and administration of government. Includes political theory, comparative systems, political socialization, public administration, political parties and elections, and international relations.');
INSERT INTO Subjects
  VALUES (55, 'POL', 'POL 102', 'American Government', 
   'Origin and development of the U.S. government. Covers the stucture and function of Congress, the Presidency and courts as well as civil liberties, political behavior and political parties.');
INSERT INTO Subjects
  VALUES (56, 'POL', 'POL 213', 'Women and Politics', 
   'Introduction to concepts of power and policy issues as they relate to women. Theoretical, historical and empirical studies of women''s participation in social and political movements nationally and internationally. Study of women''s diverse roles in relations to family, economics, labor, government, and law.');
INSERT INTO Faculty
  VALUES (98005, 'Instructor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98007, 'Associate Professor', 'Full Time', 
   1);
INSERT INTO Faculty
  VALUES (98010, 'Associate Professor', 'On Leave', 
   1);
INSERT INTO Faculty
  VALUES (98011, 'Instructor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98012, 'Instructor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98013, 'Instructor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98014, 'Professor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98019, 'Instructor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98020, 'Instructor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98025, 'Associate Professor', 'Full Time', 
   1);
INSERT INTO Faculty
  VALUES (98028, 'Professor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98030, 'Instructor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98036, 'Professor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98040, 'Associate Professor', 'Full Time', 
   1);
INSERT INTO Faculty
  VALUES (98042, 'Associate Professor', 'Full Time', 
   1);
INSERT INTO Faculty
  VALUES (98045, 'Professor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98048, 'Professor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98052, 'Instructor', 'Part Time', 0);
INSERT INTO Faculty
  VALUES (98053, 'Instructor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98055, 'Professor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98059, 'Instructor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98062, 'Associate Professor', 'Full Time', 
   0);
INSERT INTO Faculty
  VALUES (98063, 'Instructor', 'Full Time', 1);
INSERT INTO Faculty
  VALUES (98064, 'Professor', 'Full Time', 1);
INSERT INTO Classes
  VALUES (1000, 11, 1231, 5, Cast('10:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (1002, 12, 1619, 4, Cast('15:30:00' As TIME), 
   110, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (1004, 13, 1627, 4, Cast('08:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (1006, 13, 1627, 4, Cast('09:00:00' As TIME), 
   110, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (1012, 14, 1627, 4, Cast('13:00:00' As TIME), 
   170, 0, 1, 0, 1, 0, 0);
INSERT INTO Classes
  VALUES (1020, 15, 3404, 4, Cast('13:00:00' As TIME), 
   110, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (1030, 16, 1231, 5, Cast('11:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (1031, 16, 1231, 5, Cast('14:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (1156, 37, 3443, 5, Cast('08:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (1162, 37, 3443, 5, Cast('09:00:00' As TIME), 
   80, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (1168, 37, 3445, 5, Cast('11:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (1180, 38, 3446, 5, Cast('11:30:00' As TIME), 
   80, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (1183, 38, 3415, 5, Cast('13:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (1184, 38, 3415, 5, Cast('14:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (1196, 39, 3415, 5, Cast('15:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (1500, 33, 1142, 5, Cast('08:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (1502, 34, 1142, 5, Cast('09:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (1560, 35, 2408, 3, Cast('10:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (1562, 36, 2408, 5, Cast('12:00:00' As TIME), 
   110, 1, 0, 1, 0, 0, 0);
INSERT INTO Classes
  VALUES (1642, 29, 1514, 2, Cast('11:00:00' As TIME), 
   70, 0, 1, 0, 1, 0, 0);
INSERT INTO Classes
  VALUES (2001, 20, 1519, 5, Cast('07:30:00' As TIME), 
   110, 1, 0, 1, 0, 0, 0);
INSERT INTO Classes
  VALUES (2005, 20, 1515, 5, Cast('11:00:00' As TIME), 
   50, 1, 0, 1, 1, 0, 0);
INSERT INTO Classes
  VALUES (2015, 21, 1131, 5, Cast('09:00:00' As TIME), 
   110, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (2051, 22, 1515, 4, Cast('13:00:00' As TIME), 
   50, 1, 1, 1, 1, 0, 0);
INSERT INTO Classes
  VALUES (2071, 50, 1624, 5, Cast('10:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (2075, 51, 1624, 5, Cast('07:00:00' As TIME), 
   110, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (2089, 52, 1624, 5, Cast('12:00:00' As TIME), 
   50, 1, 1, 0, 1, 1, 0);
INSERT INTO Classes
  VALUES (2103, 53, 1624, 5, Cast('11:00:00' As TIME), 
   50, 1, 1, 0, 1, 1, 0);
INSERT INTO Classes
  VALUES (2213, 17, 1532, 5, Cast('10:00:00' As TIME), 
   110, 1, 0, 1, 1, 0, 0);
INSERT INTO Classes
  VALUES (2223, 18, 1532, 5, Cast('12:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (2245, 19, 1530, 5, Cast('13:30:00' As TIME), 
   110, 1, 0, 1, 0, 0, 0);
INSERT INTO Classes
  VALUES (2431, 27, 3322, 5, Cast('09:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (2451, 27, 1639, 5, Cast('13:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (2633, 48, 3420, 5, Cast('16:00:00' As TIME), 
   50, 0, 1, 0, 1, 0, 0);
INSERT INTO Classes
  VALUES (2639, 49, 3353, 3, Cast('09:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (2647, 49, 3353, 3, Cast('18:00:00' As TIME), 
   50, 0, 1, 0, 1, 0, 0);
INSERT INTO Classes
  VALUES (2889, 45, 2423, 5, Cast('09:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (2891, 45, 2423, 5, Cast('11:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (2895, 45, 2423, 5, Cast('13:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (2907, 46, 3445, 5, Cast('08:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (2911, 46, 3445, 5, Cast('12:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (2915, 46, 3353, 5, Cast('10:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (2917, 47, 3422, 5, Cast('14:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (2925, 47, 3422, 5, Cast('15:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (2933, 47, 3422, 5, Cast('09:00:00' As TIME), 
   240, 0, 0, 0, 0, 0, 1);
INSERT INTO Classes
  VALUES (3030, 30, 3352, 5, Cast('09:00:00' As TIME), 
   80, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (3031, 30, 3352, 5, Cast('13:30:00' As TIME), 
   80, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (3040, 31, 3352, 5, Cast('11:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (3045, 31, 3352, 5, Cast('12:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (3050, 32, 3343, 5, Cast('10:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (3055, 32, 3317, 5, Cast('15:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (3065, 40, 3345, 5, Cast('08:00:00' As TIME), 
   110, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (3070, 42, 3346, 5, Cast('10:30:00' As TIME), 
   140, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (3082, 44, 3346, 5, Cast('08:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (3085, 43, 3346, 5, Cast('09:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (3090, 44, 3346, 5, Cast('13:30:00' As TIME), 
   110, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (3115, 54, 3352, 5, Cast('08:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (3120, 54, 3352, 5, Cast('10:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (3123, 56, 3346, 5, Cast('12:00:00' As TIME), 
   110, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (3600, 41, 3420, 5, Cast('13:00:00' As TIME), 
   140, 1, 0, 1, 0, 0, 0);
INSERT INTO Classes
  VALUES (4025, 4, 3315, 5, Cast('11:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (4055, 5, 3313, 5, Cast('14:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (4172, 8, 3317, 3, Cast('09:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (4192, 9, 3309, 4, Cast('08:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (4196, 10, 3309, 4, Cast('10:30:00' As TIME), 
   140, 0, 1, 0, 1, 0, 0);
INSERT INTO Classes
  VALUES (4750, 1, 3313, 5, Cast('09:00:00' As TIME), 
   50, 1, 1, 0, 1, 1, 0);
INSERT INTO Classes
  VALUES (4751, 1, 3313, 5, Cast('13:00:00' As TIME), 
   50, 1, 1, 0, 1, 1, 0);
INSERT INTO Classes
  VALUES (4755, 2, 3415, 5, Cast('08:00:00' As TIME), 
   50, 1, 1, 1, 1, 0, 0);
INSERT INTO Classes
  VALUES (4760, 3, 3415, 5, Cast('10:00:00' As TIME), 
   50, 1, 1, 0, 1, 1, 0);
INSERT INTO Classes
  VALUES (4768, 6, 3307, 5, Cast('15:00:00' As TIME), 
   110, 0, 1, 1, 1, 0, 0);
INSERT INTO Classes
  VALUES (4800, 23, 3305, 5, Cast('08:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (4810, 23, 3319, 5, Cast('08:00:00' As TIME), 
   50, 0, 1, 0, 1, 0, 0);
INSERT INTO Classes
  VALUES (4812, 24, 3330, 3, Cast('12:00:00' As TIME), 
   80, 0, 1, 0, 1, 0, 0);
INSERT INTO Classes
  VALUES (4813, 24, 3406, 3, Cast('10:00:00' As TIME), 
   50, 1, 0, 1, 0, 1, 0);
INSERT INTO Classes
  VALUES (4825, 25, 3319, 5, Cast('11:00:00' As TIME), 
   50, 1, 1, 1, 1, 1, 0);
INSERT INTO Classes
  VALUES (4880, 26, 1231, 5, Cast('13:30:00' As TIME), 
   110, 1, 0, 1, 0, 1, 0);
INSERT INTO Faculty_Classes
  VALUES (1000, 98014);
INSERT INTO Faculty_Classes
  VALUES (1002, 98036);
INSERT INTO Faculty_Classes
  VALUES (1004, 98019);
INSERT INTO Faculty_Classes
  VALUES (1006, 98045);
INSERT INTO Faculty_Classes
  VALUES (1012, 98030);
INSERT INTO Faculty_Classes
  VALUES (1020, 98028);
INSERT INTO Faculty_Classes
  VALUES (1030, 98036);
INSERT INTO Faculty_Classes
  VALUES (1031, 98005);
INSERT INTO Faculty_Classes
  VALUES (1156, 98055);
INSERT INTO Faculty_Classes
  VALUES (1162, 98064);
INSERT INTO Faculty_Classes
  VALUES (1168, 98055);
INSERT INTO Faculty_Classes
  VALUES (1180, 98011);
INSERT INTO Faculty_Classes
  VALUES (1183, 98005);
INSERT INTO Faculty_Classes
  VALUES (1184, 98011);
INSERT INTO Faculty_Classes
  VALUES (1196, 98028);
INSERT INTO Faculty_Classes
  VALUES (1500, 98028);
INSERT INTO Faculty_Classes
  VALUES (1502, 98036);
INSERT INTO Faculty_Classes
  VALUES (1560, 98028);
INSERT INTO Faculty_Classes
  VALUES (1562, 98036);
INSERT INTO Faculty_Classes
  VALUES (2001, 98020);
INSERT INTO Faculty_Classes
  VALUES (2005, 98063);
INSERT INTO Faculty_Classes
  VALUES (2015, 98053);
INSERT INTO Faculty_Classes
  VALUES (2051, 98020);
INSERT INTO Faculty_Classes
  VALUES (2071, 98020);
INSERT INTO Faculty_Classes
  VALUES (2075, 98053);
INSERT INTO Faculty_Classes
  VALUES (2089, 98052);
INSERT INTO Faculty_Classes
  VALUES (2103, 98053);
INSERT INTO Faculty_Classes
  VALUES (2213, 98052);
INSERT INTO Faculty_Classes
  VALUES (2223, 98053);
INSERT INTO Faculty_Classes
  VALUES (2245, 98063);
INSERT INTO Faculty_Classes
  VALUES (2431, 98012);
INSERT INTO Faculty_Classes
  VALUES (2451, 98040);
INSERT INTO Faculty_Classes
  VALUES (2633, 98030);
INSERT INTO Faculty_Classes
  VALUES (2639, 98011);
INSERT INTO Faculty_Classes
  VALUES (2647, 98011);
INSERT INTO Faculty_Classes
  VALUES (2889, 98040);
INSERT INTO Faculty_Classes
  VALUES (2891, 98012);
INSERT INTO Faculty_Classes
  VALUES (2895, 98013);
INSERT INTO Faculty_Classes
  VALUES (2907, 98013);
INSERT INTO Faculty_Classes
  VALUES (2911, 98013);
INSERT INTO Faculty_Classes
  VALUES (2915, 98013);
INSERT INTO Faculty_Classes
  VALUES (2917, 98025);
INSERT INTO Faculty_Classes
  VALUES (2925, 98019);
INSERT INTO Faculty_Classes
  VALUES (2933, 98025);
INSERT INTO Faculty_Classes
  VALUES (3030, 98048);
INSERT INTO Faculty_Classes
  VALUES (3031, 98030);
INSERT INTO Faculty_Classes
  VALUES (3040, 98059);
INSERT INTO Faculty_Classes
  VALUES (3045, 98042);
INSERT INTO Faculty_Classes
  VALUES (3050, 98012);
INSERT INTO Faculty_Classes
  VALUES (3055, 98012);
INSERT INTO Faculty_Classes
  VALUES (3065, 98042);
INSERT INTO Faculty_Classes
  VALUES (3070, 98030);
INSERT INTO Faculty_Classes
  VALUES (3082, 98030);
INSERT INTO Faculty_Classes
  VALUES (3085, 98059);
INSERT INTO Faculty_Classes
  VALUES (3090, 98014);
INSERT INTO Faculty_Classes
  VALUES (3115, 98048);
INSERT INTO Faculty_Classes
  VALUES (3120, 98059);
INSERT INTO Faculty_Classes
  VALUES (3123, 98059);
INSERT INTO Faculty_Classes
  VALUES (3600, 98042);
INSERT INTO Faculty_Classes
  VALUES (4025, 98062);
INSERT INTO Faculty_Classes
  VALUES (4055, 98007);
INSERT INTO Faculty_Classes
  VALUES (4172, 98055);
INSERT INTO Faculty_Classes
  VALUES (4192, 98025);
INSERT INTO Faculty_Classes
  VALUES (4196, 98062);
INSERT INTO Faculty_Classes
  VALUES (4750, 98062);
INSERT INTO Faculty_Classes
  VALUES (4751, 98012);
INSERT INTO Faculty_Classes
  VALUES (4755, 98007);
INSERT INTO Faculty_Classes
  VALUES (4760, 98055);
INSERT INTO Faculty_Classes
  VALUES (4768, 98055);
INSERT INTO Faculty_Classes
  VALUES (4800, 98045);
INSERT INTO Faculty_Classes
  VALUES (4810, 98045);
INSERT INTO Faculty_Classes
  VALUES (4812, 98007);
INSERT INTO Faculty_Classes
  VALUES (4813, 98007);
INSERT INTO Faculty_Classes
  VALUES (4825, 98020);
INSERT INTO Faculty_Classes
  VALUES (4880, 98045);
INSERT INTO Student_Schedules
  VALUES (1001, 1560, 2, 93.28);
INSERT INTO Student_Schedules
  VALUES (1001, 2071, 2, 66.41);
INSERT INTO Student_Schedules
  VALUES (1001, 4055, 1, 62.85);
INSERT INTO Student_Schedules
  VALUES (1001, 4760, 3, 0);
INSERT INTO Student_Schedules
  VALUES (1001, 4812, 2, 66.91);
INSERT INTO Student_Schedules
  VALUES (1002, 1560, 2, 84.75);
INSERT INTO Student_Schedules
  VALUES (1002, 2071, 2, 76.02);
INSERT INTO Student_Schedules
  VALUES (1002, 4055, 1, 68.5);
INSERT INTO Student_Schedules
  VALUES (1002, 4760, 2, 79.43);
INSERT INTO Student_Schedules
  VALUES (1002, 4812, 1, 58.27);
INSERT INTO Student_Schedules
  VALUES (1003, 1560, 2, 82.85);
INSERT INTO Student_Schedules
  VALUES (1003, 2071, 1, 77.2);
INSERT INTO Student_Schedules
  VALUES (1003, 4055, 1, 75.38);
INSERT INTO Student_Schedules
  VALUES (1003, 4760, 2, 90.67);
INSERT INTO Student_Schedules
  VALUES (1003, 4812, 1, 81.9);
INSERT INTO Student_Schedules
  VALUES (1004, 1031, 2, 80.78);
INSERT INTO Student_Schedules
  VALUES (1004, 1180, 1, 56.36);
INSERT INTO Student_Schedules
  VALUES (1004, 1502, 1, 69.32);
INSERT INTO Student_Schedules
  VALUES (1004, 4768, 1, 61.1);
INSERT INTO Student_Schedules
  VALUES (1005, 1180, 2, 69.71);
INSERT INTO Student_Schedules
  VALUES (1005, 1502, 2, 76.28);
INSERT INTO Student_Schedules
  VALUES (1005, 1562, 2, 67.59);
INSERT INTO Student_Schedules
  VALUES (1005, 4768, 2, 79.31);
INSERT INTO Student_Schedules
  VALUES (1006, 1000, 1, 89.2);
INSERT INTO Student_Schedules
  VALUES (1006, 1012, 2, 85.05);
INSERT INTO Student_Schedules
  VALUES (1006, 1031, 2, 91.72);
INSERT INTO Student_Schedules
  VALUES (1006, 1168, 2, 85.31);
INSERT INTO Student_Schedules
  VALUES (1006, 3115, 1, 83.23);
INSERT INTO Student_Schedules
  VALUES (1006, 4055, 2, 87.82);
INSERT INTO Student_Schedules
  VALUES (1007, 1000, 2, 93.27);
INSERT INTO Student_Schedules
  VALUES (1007, 1012, 1, 98.36);
INSERT INTO Student_Schedules
  VALUES (1007, 1031, 2, 79.59);
INSERT INTO Student_Schedules
  VALUES (1007, 1168, 2, 92.9);
INSERT INTO Student_Schedules
  VALUES (1007, 3115, 1, 92.25);
INSERT INTO Student_Schedules
  VALUES (1007, 4055, 2, 90.24);
INSERT INTO Student_Schedules
  VALUES (1008, 1560, 1, 79.93);
INSERT INTO Student_Schedules
  VALUES (1008, 2071, 1, 82.31);
INSERT INTO Student_Schedules
  VALUES (1008, 4055, 2, 89.27);
INSERT INTO Student_Schedules
  VALUES (1008, 4760, 2, 90.58);
INSERT INTO Student_Schedules
  VALUES (1008, 4812, 2, 71.73);
INSERT INTO Student_Schedules
  VALUES (1009, 1560, 2, 92.08);
INSERT INTO Student_Schedules
  VALUES (1009, 2071, 3, 0);
INSERT INTO Student_Schedules
  VALUES (1009, 4055, 1, 63.56);
INSERT INTO Student_Schedules
  VALUES (1009, 4760, 1, 95.59);
INSERT INTO Student_Schedules
  VALUES (1009, 4812, 2, 67.44);
INSERT INTO Student_Schedules
  VALUES (1010, 1180, 2, 73.68);
INSERT INTO Student_Schedules
  VALUES (1010, 1502, 1, 69.34);
INSERT INTO Student_Schedules
  VALUES (1010, 1562, 2, 98.26);
INSERT INTO Student_Schedules
  VALUES (1010, 4768, 1, 82.02);
INSERT INTO Student_Schedules
  VALUES (1011, 1000, 1, 81.88);
INSERT INTO Student_Schedules
  VALUES (1011, 1012, 1, 89.52);
INSERT INTO Student_Schedules
  VALUES (1011, 1031, 1, 87.17);
INSERT INTO Student_Schedules
  VALUES (1011, 1168, 2, 93.7);
INSERT INTO Student_Schedules
  VALUES (1011, 3115, 2, 72.68);
INSERT INTO Student_Schedules
  VALUES (1011, 4055, 2, 71.45);
INSERT INTO Student_Schedules
  VALUES (1012, 1031, 2, 91.4);
INSERT INTO Student_Schedules
  VALUES (1012, 1180, 2, 97.39);
INSERT INTO Student_Schedules
  VALUES (1012, 1502, 1, 85.92);
INSERT INTO Student_Schedules
  VALUES (1012, 4768, 1, 89.22);
INSERT INTO Student_Schedules
  VALUES (1012, 4800, 2, 87);
INSERT INTO Student_Schedules
  VALUES (1013, 1000, 1, 66.61);
INSERT INTO Student_Schedules
  VALUES (1013, 1012, 1, 79.74);
INSERT INTO Student_Schedules
  VALUES (1013, 1031, 2, 74.01);
INSERT INTO Student_Schedules
  VALUES (1013, 1168, 1, 77.91);
INSERT INTO Student_Schedules
  VALUES (1013, 3115, 2, 73.96);
INSERT INTO Student_Schedules
  VALUES (1013, 4055, 2, 90.01);
INSERT INTO Student_Schedules
  VALUES (1014, 1000, 2, 88.27);
INSERT INTO Student_Schedules
  VALUES (1014, 1012, 2, 92.05);
INSERT INTO Student_Schedules
  VALUES (1014, 1031, 2, 91.56);
INSERT INTO Student_Schedules
  VALUES (1014, 1168, 3, 0);
INSERT INTO Student_Schedules
  VALUES (1014, 3115, 2, 75.8);
INSERT INTO Student_Schedules
  VALUES (1014, 4055, 1, 80.43);
INSERT INTO Student_Schedules
  VALUES (1015, 1180, 2, 93.86);
INSERT INTO Student_Schedules
  VALUES (1015, 1502, 2, 90.16);
INSERT INTO Student_Schedules
  VALUES (1015, 1562, 2, 96.36);
INSERT INTO Student_Schedules
  VALUES (1015, 4768, 2, 67.67);
INSERT INTO Student_Schedules
  VALUES (1016, 1000, 1, 73.71);
INSERT INTO Student_Schedules
  VALUES (1016, 1012, 1, 70.77);
INSERT INTO Student_Schedules
  VALUES (1016, 1031, 2, 72.79);
INSERT INTO Student_Schedules
  VALUES (1016, 1168, 1, 98.74);
INSERT INTO Student_Schedules
  VALUES (1016, 3115, 2, 77.46);
INSERT INTO Student_Schedules
  VALUES (1016, 4055, 2, 84.37);
INSERT INTO Student_Schedules
  VALUES (1017, 1031, 2, 77.45);
INSERT INTO Student_Schedules
  VALUES (1017, 1180, 1, 78.34);
INSERT INTO Student_Schedules
  VALUES (1017, 1502, 2, 72.15);
INSERT INTO Student_Schedules
  VALUES (1017, 4768, 2, 85.26);
INSERT INTO Student_Schedules
  VALUES (1018, 1031, 2, 87.05);
INSERT INTO Student_Schedules
  VALUES (1018, 1180, 2, 69.88);
INSERT INTO Student_Schedules
  VALUES (1018, 1502, 2, 67.13);
INSERT INTO Student_Schedules
  VALUES (1018, 4768, 1, 81.23);
INSERT INTO Faculty_Subjects
  VALUES (98005, 12, 10);
INSERT INTO Faculty_Subjects
  VALUES (98005, 16, 10);
INSERT INTO Faculty_Subjects
  VALUES (98005, 34, 9);
INSERT INTO Faculty_Subjects
  VALUES (98005, 36, 8);
INSERT INTO Faculty_Subjects
  VALUES (98005, 38, 8);
INSERT INTO Faculty_Subjects
  VALUES (98007, 2, 9);
INSERT INTO Faculty_Subjects
  VALUES (98007, 5, 10);
INSERT INTO Faculty_Subjects
  VALUES (98007, 14, 8);
INSERT INTO Faculty_Subjects
  VALUES (98007, 24, 10);
INSERT INTO Faculty_Subjects
  VALUES (98007, 46, 10);
INSERT INTO Faculty_Subjects
  VALUES (98010, 2, 8);
INSERT INTO Faculty_Subjects
  VALUES (98010, 5, 10);
INSERT INTO Faculty_Subjects
  VALUES (98010, 24, 8);
INSERT INTO Faculty_Subjects
  VALUES (98010, 48, 10);
INSERT INTO Faculty_Subjects
  VALUES (98011, 38, 9);
INSERT INTO Faculty_Subjects
  VALUES (98011, 43, 8);
INSERT INTO Faculty_Subjects
  VALUES (98011, 49, 10);
INSERT INTO Faculty_Subjects
  VALUES (98012, 1, 9);
INSERT INTO Faculty_Subjects
  VALUES (98012, 4, 10);
INSERT INTO Faculty_Subjects
  VALUES (98012, 32, 9);
INSERT INTO Faculty_Subjects
  VALUES (98012, 45, 9);
INSERT INTO Faculty_Subjects
  VALUES (98013, 23, 9);
INSERT INTO Faculty_Subjects
  VALUES (98013, 26, 8);
INSERT INTO Faculty_Subjects
  VALUES (98013, 27, 10);
INSERT INTO Faculty_Subjects
  VALUES (98013, 28, 9);
INSERT INTO Faculty_Subjects
  VALUES (98013, 46, 10);
INSERT INTO Faculty_Subjects
  VALUES (98014, 11, 9);
INSERT INTO Faculty_Subjects
  VALUES (98014, 15, 9);
INSERT INTO Faculty_Subjects
  VALUES (98014, 39, 9);
INSERT INTO Faculty_Subjects
  VALUES (98014, 42, 9);
INSERT INTO Faculty_Subjects
  VALUES (98014, 44, 9);
INSERT INTO Faculty_Subjects
  VALUES (98019, 13, 9);
INSERT INTO Faculty_Subjects
  VALUES (98019, 32, 9);
INSERT INTO Faculty_Subjects
  VALUES (98019, 47, 8);
INSERT INTO Faculty_Subjects
  VALUES (98020, 20, 8);
INSERT INTO Faculty_Subjects
  VALUES (98020, 22, 10);
INSERT INTO Faculty_Subjects
  VALUES (98020, 25, 8);
INSERT INTO Faculty_Subjects
  VALUES (98020, 50, 8);
INSERT INTO Faculty_Subjects
  VALUES (98020, 52, 8);
INSERT INTO Faculty_Subjects
  VALUES (98025, 3, 10);
INSERT INTO Faculty_Subjects
  VALUES (98025, 7, 10);
INSERT INTO Faculty_Subjects
  VALUES (98025, 9, 10);
INSERT INTO Faculty_Subjects
  VALUES (98025, 47, 10);
INSERT INTO Faculty_Subjects
  VALUES (98028, 11, 8);
INSERT INTO Faculty_Subjects
  VALUES (98028, 15, 10);
INSERT INTO Faculty_Subjects
  VALUES (98028, 33, 9);
INSERT INTO Faculty_Subjects
  VALUES (98028, 35, 8);
INSERT INTO Faculty_Subjects
  VALUES (98028, 39, 8);
INSERT INTO Faculty_Subjects
  VALUES (98030, 14, 10);
INSERT INTO Faculty_Subjects
  VALUES (98030, 30, 8);
INSERT INTO Faculty_Subjects
  VALUES (98030, 42, 10);
INSERT INTO Faculty_Subjects
  VALUES (98030, 44, 9);
INSERT INTO Faculty_Subjects
  VALUES (98030, 48, 9);
INSERT INTO Faculty_Subjects
  VALUES (98036, 12, 10);
INSERT INTO Faculty_Subjects
  VALUES (98036, 16, 9);
INSERT INTO Faculty_Subjects
  VALUES (98036, 34, 9);
INSERT INTO Faculty_Subjects
  VALUES (98036, 36, 8);
INSERT INTO Faculty_Subjects
  VALUES (98040, 25, 8);
INSERT INTO Faculty_Subjects
  VALUES (98040, 27, 8);
INSERT INTO Faculty_Subjects
  VALUES (98040, 28, 10);
INSERT INTO Faculty_Subjects
  VALUES (98040, 45, 8);
INSERT INTO Faculty_Subjects
  VALUES (98042, 31, 9);
INSERT INTO Faculty_Subjects
  VALUES (98042, 40, 8);
INSERT INTO Faculty_Subjects
  VALUES (98042, 41, 10);
INSERT INTO Faculty_Subjects
  VALUES (98042, 55, 8);
INSERT INTO Faculty_Subjects
  VALUES (98042, 56, 9);
INSERT INTO Faculty_Subjects
  VALUES (98045, 13, 10);
INSERT INTO Faculty_Subjects
  VALUES (98045, 23, 8);
INSERT INTO Faculty_Subjects
  VALUES (98045, 26, 9);
INSERT INTO Faculty_Subjects
  VALUES (98045, 33, 9);
INSERT INTO Faculty_Subjects
  VALUES (98045, 35, 9);
INSERT INTO Faculty_Subjects
  VALUES (98048, 7, 10);
INSERT INTO Faculty_Subjects
  VALUES (98048, 9, 8);
INSERT INTO Faculty_Subjects
  VALUES (98048, 30, 8);
INSERT INTO Faculty_Subjects
  VALUES (98048, 54, 9);
INSERT INTO Faculty_Subjects
  VALUES (98048, 55, 10);
INSERT INTO Faculty_Subjects
  VALUES (98052, 17, 8);
INSERT INTO Faculty_Subjects
  VALUES (98052, 18, 8);
INSERT INTO Faculty_Subjects
  VALUES (98052, 21, 10);
INSERT INTO Faculty_Subjects
  VALUES (98052, 50, 10);
INSERT INTO Faculty_Subjects
  VALUES (98052, 52, 9);
INSERT INTO Faculty_Subjects
  VALUES (98053, 18, 9);
INSERT INTO Faculty_Subjects
  VALUES (98053, 19, 9);
INSERT INTO Faculty_Subjects
  VALUES (98053, 21, 8);
INSERT INTO Faculty_Subjects
  VALUES (98053, 51, 9);
INSERT INTO Faculty_Subjects
  VALUES (98053, 53, 9);
INSERT INTO Faculty_Subjects
  VALUES (98055, 3, 8);
INSERT INTO Faculty_Subjects
  VALUES (98055, 6, 8);
INSERT INTO Faculty_Subjects
  VALUES (98055, 8, 9);
INSERT INTO Faculty_Subjects
  VALUES (98055, 10, 10);
INSERT INTO Faculty_Subjects
  VALUES (98055, 37, 10);
INSERT INTO Faculty_Subjects
  VALUES (98059, 31, 8);
INSERT INTO Faculty_Subjects
  VALUES (98059, 43, 10);
INSERT INTO Faculty_Subjects
  VALUES (98059, 54, 9);
INSERT INTO Faculty_Subjects
  VALUES (98059, 56, 9);
INSERT INTO Faculty_Subjects
  VALUES (98062, 1, 10);
INSERT INTO Faculty_Subjects
  VALUES (98062, 4, 8);
INSERT INTO Faculty_Subjects
  VALUES (98062, 6, 8);
INSERT INTO Faculty_Subjects
  VALUES (98062, 8, 10);
INSERT INTO Faculty_Subjects
  VALUES (98062, 10, 10);
INSERT INTO Faculty_Subjects
  VALUES (98062, 49, 9);
INSERT INTO Faculty_Subjects
  VALUES (98063, 17, 9);
INSERT INTO Faculty_Subjects
  VALUES (98063, 19, 9);
INSERT INTO Faculty_Subjects
  VALUES (98063, 20, 9);
INSERT INTO Faculty_Subjects
  VALUES (98063, 22, 8);
INSERT INTO Faculty_Subjects
  VALUES (98063, 51, 9);
INSERT INTO Faculty_Subjects
  VALUES (98063, 53, 8);
INSERT INTO Faculty_Subjects
  VALUES (98064, 37, 8);
INSERT INTO Faculty_Subjects
  VALUES (98064, 40, 9);
INSERT INTO Faculty_Subjects
  VALUES (98064, 41, 8);
INSERT INTO Faculty_Categories
  VALUES (98005, 'ART');
INSERT INTO Faculty_Categories
  VALUES (98005, 'ENG');
INSERT INTO Faculty_Categories
  VALUES (98005, 'MUS');
INSERT INTO Faculty_Categories
  VALUES (98007, 'ACC');
INSERT INTO Faculty_Categories
  VALUES (98007, 'ART');
INSERT INTO Faculty_Categories
  VALUES (98007, 'CIS');
INSERT INTO Faculty_Categories
  VALUES (98007, 'MAT');
INSERT INTO Faculty_Categories
  VALUES (98010, 'ACC');
INSERT INTO Faculty_Categories
  VALUES (98010, 'CIS');
INSERT INTO Faculty_Categories
  VALUES (98010, 'MAT');
INSERT INTO Faculty_Categories
  VALUES (98011, 'ENG');
INSERT INTO Faculty_Categories
  VALUES (98011, 'HIS');
INSERT INTO Faculty_Categories
  VALUES (98011, 'MAT');
INSERT INTO Faculty_Categories
  VALUES (98012, 'ACC');
INSERT INTO Faculty_Categories
  VALUES (98012, 'ECO');
INSERT INTO Faculty_Categories
  VALUES (98012, 'MAT');
INSERT INTO Faculty_Categories
  VALUES (98013, 'CIS');
INSERT INTO Faculty_Categories
  VALUES (98013, 'CSC');
INSERT INTO Faculty_Categories
  VALUES (98013, 'MAT');
INSERT INTO Faculty_Categories
  VALUES (98014, 'ART');
INSERT INTO Faculty_Categories
  VALUES (98014, 'ENG');
INSERT INTO Faculty_Categories
  VALUES (98014, 'HIS');
INSERT INTO Faculty_Categories
  VALUES (98019, 'ART');
INSERT INTO Faculty_Categories
  VALUES (98019, 'ECO');
INSERT INTO Faculty_Categories
  VALUES (98019, 'MAT');
INSERT INTO Faculty_Categories
  VALUES (98020, 'CHE');
INSERT INTO Faculty_Categories
  VALUES (98020, 'CIS');
INSERT INTO Faculty_Categories
  VALUES (98020, 'PHY');
INSERT INTO Faculty_Categories
  VALUES (98025, 'ACC');
INSERT INTO Faculty_Categories
  VALUES (98025, 'BUS');
INSERT INTO Faculty_Categories
  VALUES (98025, 'MAT');
INSERT INTO Faculty_Categories
  VALUES (98028, 'ART');
INSERT INTO Faculty_Categories
  VALUES (98028, 'ENG');
INSERT INTO Faculty_Categories
  VALUES (98028, 'MUS');
INSERT INTO Faculty_Categories
  VALUES (98030, 'ART');
INSERT INTO Faculty_Categories
  VALUES (98030, 'ECO');
INSERT INTO Faculty_Categories
  VALUES (98030, 'HIS');
INSERT INTO Faculty_Categories
  VALUES (98030, 'MAT');
INSERT INTO Faculty_Categories
  VALUES (98036, 'ART');
INSERT INTO Faculty_Categories
  VALUES (98036, 'ENG');
INSERT INTO Faculty_Categories
  VALUES (98036, 'MUS');
INSERT INTO Faculty_Categories
  VALUES (98040, 'CIS');
INSERT INTO Faculty_Categories
  VALUES (98040, 'CSC');
INSERT INTO Faculty_Categories
  VALUES (98040, 'MAT');
INSERT INTO Faculty_Categories
  VALUES (98042, 'ECO');
INSERT INTO Faculty_Categories
  VALUES (98042, 'GEG');
INSERT INTO Faculty_Categories
  VALUES (98042, 'POL');
INSERT INTO Faculty_Categories
  VALUES (98045, 'ART');
INSERT INTO Faculty_Categories
  VALUES (98045, 'CIS');
INSERT INTO Faculty_Categories
  VALUES (98045, 'MUS');
INSERT INTO Faculty_Categories
  VALUES (98048, 'BUS');
INSERT INTO Faculty_Categories
  VALUES (98048, 'ECO');
INSERT INTO Faculty_Categories
  VALUES (98048, 'POL');
INSERT INTO Faculty_Categories
  VALUES (98052, 'BIO');
INSERT INTO Faculty_Categories
  VALUES (98052, 'CHE');
INSERT INTO Faculty_Categories
  VALUES (98052, 'MAT');
INSERT INTO Faculty_Categories
  VALUES (98052, 'PHY');
INSERT INTO Faculty_Categories
  VALUES (98053, 'BIO');
INSERT INTO Faculty_Categories
  VALUES (98053, 'CHE');
INSERT INTO Faculty_Categories
  VALUES (98053, 'PHY');
INSERT INTO Faculty_Categories
  VALUES (98055, 'ACC');
INSERT INTO Faculty_Categories
  VALUES (98055, 'BUS');
INSERT INTO Faculty_Categories
  VALUES (98055, 'ENG');
INSERT INTO Faculty_Categories
  VALUES (98055, 'MAT');
INSERT INTO Faculty_Categories
  VALUES (98059, 'ECO');
INSERT INTO Faculty_Categories
  VALUES (98059, 'HIS');
INSERT INTO Faculty_Categories
  VALUES (98059, 'POL');
INSERT INTO Faculty_Categories
  VALUES (98062, 'ACC');
INSERT INTO Faculty_Categories
  VALUES (98062, 'BUS');
INSERT INTO Faculty_Categories
  VALUES (98062, 'MAT');
INSERT INTO Faculty_Categories
  VALUES (98063, 'BIO');
INSERT INTO Faculty_Categories
  VALUES (98063, 'CHE');
INSERT INTO Faculty_Categories
  VALUES (98063, 'PHY');
INSERT INTO Faculty_Categories
  VALUES (98064, 'ENG');
INSERT INTO Faculty_Categories
  VALUES (98064, 'GEG');
INSERT INTO Faculty_Categories
  VALUES (98064, 'JRN');