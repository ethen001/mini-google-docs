drop table if exists revisions;
drop table if exists sharedDocs;
drop table if exists interests;
drop table if exists documents;
drop table if exists users;
drop table if exists complaints;
drop table if exists tabooList;
drop table if exists tabooSuggestions;
drop table if exists application;

CREATE TABLE complaints (
    complaintID int PRIMARY KEY AUTO_INCREMENT,
    DocID int,
    version int,
    owner varchar(20),
    complainer varchar(20),
    message text
);

CREATE TABLE application (
    userName varchar(20) PRIMARY KEY,
    password varchar(20) NOT NULL,
    firstName varchar(20) NOT NULL,
    lastName varchar(50) NOT NULL,
    interest0 varchar(20) NOT NULL,
    interest1 varchar(20) NOT NULL,
    interest2 varchar(20) NOT NULL,
    membershipLevel int
);

CREATE TABLE users (
    userName varchar(20) PRIMARY KEY,
    password varchar(20) NOT NULL,
    firstName varchar(20) NOT NULL,
    lastName varchar(50) NOT NULL,
    membershipLevel int NOT NULL
);

CREATE TABLE interests (
    userName varchar(20),
    FOREIGN KEY (userName) REFERENCES users(userName),
    interest varchar(20)
);

CREATE TABLE documents (
    docID int PRIMARY KEY AUTO_INCREMENT,
    owner varchar(20),
    FOREIGN KEY (owner) REFERENCES users(userName),
    docName varchar(20),
    content text,
    isLocked int NOT NULL,
    restricted int NOT NULL,
    createdDate date NOT NULL,
    tabooFlag int
);

CREATE TABLE revisions (
    docID int(50) NOT NULL,
    version int NOT NULL,
    dateOfEdit date NOT NULL,
    author varchar(20),
    content text,
    FOREIGN KEY (author) REFERENCES users(userName),
    FOREIGN KEY (docID) REFERENCES documents(docID)
);

CREATE TABLE tabooList (
    tabooWord varchar(20) NOT NULL
);

CREATE TABLE tabooSuggestions(
    userName varchar(20) NOT NULL,
    tabooWord varchar(20) NOT NULL
);

CREATE TABLE sharedDocs (
    userName varchar(20) NOT NULL,
    docID int NOT NULL,
    FOREIGN KEY(userName) REFERENCES users(userName),
    FOREIGN KEY(docID) REFERENCES documents(docID)
);


insert into users value("Jon", "password", "Jonathan", "Tran", 1);
insert into interests values
("Jon", "Sleeping"),
("Jon", "Eating"),
("Jon", "Lifting");

insert into users value("Peter", "password", "Peter", "Phung", 2);
insert into interests values
("Peter", "Filming"),
("Peter", "Engineering"),
("Peter", "Photography");

insert into users values("Ant", "password", "Ant", "Hony", 1);
insert into interests values
("Ant", "Youtubing"),
("Ant", "Gaming"),
("Ant", "Writing Sketches");

insert into users value("Kelly", "password", "Kelly", "Tran", 1);
insert into interests values
("Kelly", "Sleeping"),
("Kelly", "Doing Nothing"),
("Kelly", "Lifting");

insert into users value("kduggan15", "pass", "Kieran", "Duggan");
insert into interests values
("kduggan15","Programming"),
("kduggan15","Bowery"),
("kduggan15","Coffee");

insert into documents (owner,docName,content,isLocked,restricted,createdDate,tabooFlag)values
("Jon","My Shopping List","World\nWar\nThree",0,1,"2011-08-12",0),
("Jon","My Hello List","World\nGood\nThree",0,1,"2011-08-12",0),
("Jon","My Good Job List","MAN\nWar\nThree",0,1,"2011-08-12",0),
("Jon","The Jefferson's","Walter\nAccount\n112233",0,2,"2011-08-12",0),
("Jon","Good list","World\nGood\nThree",0,3,"2011-08-12",0),
("Jon","Food Bank","Pizza\nSoda\nChips",0,2,"2011-08-12",0),
("Ant","Food Bank","Pizza\nSoda\nChips",0,3,"2011-08-12",0),
("Jon","No no Words","Pizza\nfuck\nUNK",0,3,"2011-08-12",1),
("Jon","No no Words2","fuck\nfuck\nUNK",0,3,"2011-08-12",1);

insert into tabooList values
 ('fuck'),
 ('cunt'),
 ('moffo'),
 ('faggot'),
 ('shit');
 insert into sharedDocs (userName, docID)values
 ("Jon", 7),
 ("Ant", 1);
