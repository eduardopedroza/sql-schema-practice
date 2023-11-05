CREATE TABLE Region (
    RegionID INT PRIMARY KEY,
    Name VARCHAR(20)
)

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    PrefferredRegionID INT,
    Username VARCHAR(50),
    Email VARCHAR(50),
    Password VARCHAR(50),
    FOREIGN KEY (PreferredRegionID) REFERENCES Region(RegionID)
)

CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    Title VARCHAR(20),
    Content TEXT,
    UserID INT,
    Location VARCHAR(20),
    RegionID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
)

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE PostCategory (
    PostID INT,
    CategoryID INT,
    PRIMARY KEY (PostID, CategoryID)   
    FOREIGN KEY (PostID) REFERENCES Post(PostID)
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
)