CREATE TABLE Season (
    SeasonID INT PRIMARY KEY,
    StartDate DATE,
    EndDate DATE
)

CREATE TABLE Team (
    TeamID INT PRIMARY KEY,
    Name VARCHAR(20),
)

CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    Name VARCHAR(20),
    TeamID INT,
    FOREIGN KEY TeamID REFERENCES Team(TeamID)
)

CREATE TABLE Referee (
    RefereeID INT PRIMARY KEY,
    Name VARCHAR(20)
)


CREATE TABLE Match (
    MatchID INT PRIMARY KEY,
    SeasonID INT,
    RefereeID INT,
    HomeTeam INT,
    AwayTeam INT,
    MatchDate Date,
    FOREIGN KEY (SeasonID) REFERENCES Season(SeasonID),
    FOREIGN KEY (RefereeID) REFERENCES Referee(RefereeID),
    FOREIGN KEY (HomeTeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (AwayTeamID) REFERENCES Team(TeamID)
)

CREATE TABLE Goal (
    GoalID PRIMARY KEY INT,
    MatchID INT,
    PlayerID INT,
    GameID INT,
    TimeScored TIME,
    FOREIGN KEY MatchID REFERENCES Match(MatchID),
    FOREIGN KEY PlayerID REFERENCES Player(PlayerID)
)

CREATE TABLE Standing (
    TeamID INT,
    SeasonID INT,
    Points INT DEFAULT 0, 
    GoalsFor INT DEFAULT 0,
    GoalsAgainst INT DEFAULT 0,
    Wins INT DEFAULT 0,
    Losses INT DEFAULT 0,
    Draws INT DEFAULT 0,
    PRIMARY KEY (TeamID, SeasonID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (SeasonID) REFERENCES Season(SeasonID)
);
