/*DROP DATABASE MLS_Db_Cop4710;*/
CREATE DATABASE MLS_Db_Cop4710; 
USE MLS_Db_Cop4710;
CREATE TABLE Property (
address VARCHAR(50) NOT NULL,
ownerName VARCHAR(30),
price INTEGER,
PRIMARY KEY (address)
); 

CREATE TABLE House (
bedrooms INTEGER,
bathrooms INTEGER,
size INTEGER, 
address VARCHAR(50) NOT NULL,
ownerName VARCHAR(30),
price INTEGER,
FOREIGN KEY (address)
	REFERENCES property(address)
); 

CREATE TABLE BusinessProperty(
type CHAR(20),
size INTEGER,
address VARCHAR(50) NOT NULL,
ownerName VARCHAR(30),
price INTEGER,
FOREIGN KEY (address)
	REFERENCES property(address)
);

CREATE TABLE Firm(
id INTEGER NOT NULL, 
name VARCHAR(30), 
address VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE Agent ( 
agentId INTEGER NOT NULL, 
name VARCHAR(30), 
phone CHAR(12), 
firmId INTEGER NOT NULL, 
dateStarted DATE,
PRIMARY KEY (agentId),
FOREIGN KEY (firmId) REFERENCES Firm(id)
); 


CREATE TABLE Listings (
address VARCHAR(50), 
agentId INTEGER, 
mlsNumber INTEGER,
PRIMARY KEY (mlsNumber),
dateListed DATE,
FOREIGN KEY(agentId) REFERENCES Agent(agentId),
FOREIGN KEY (address) REFERENCES Property(address)
); 

CREATE TABLE Buyer (
id INTEGER NOT NULL, 
name VARCHAR(30), 
phone CHAR(12), 
propertyType CHAR(20),
bedrooms INTEGER,
bathrooms INTEGER,
businessPropertyType CHAR(20),
minimumPreferredPrice INTEGER, 
maximumPreferredPrice INTEGER,
PRIMARY KEY (id)
);


CREATE TABLE Works_With(
buyerId INTEGER, 
agentID INTEGER,
FOREIGN KEY (buyerId) REFERENCES Buyer(id),
FOREIGN KEY (agentId) REFERENCES Agent(agentId)
);


/*Below is the insertions into the data tables for the querery*/

/*12 properties*/

INSERT INTO Property
VALUES('9422 Devon St', 'Uma August', 825065);

INSERT INTO Property
VALUES('618 Catherine Ave', 'Karina Xenocrates', 657571);

INSERT INTO Property
VALUES('103 East Willow Rd', 'Andon Erebus', 743940);

INSERT INTO Property
VALUES('781 Essex Avenue', 'Yuri Jacob', 810268);

INSERT INTO Property
VALUES('9640 Woodsman Rd', 'Arushi Darrell', 580854);

INSERT INTO Property
VALUES('8566 Brickell St', 'Lyudmila Ogden', 301557);

INSERT INTO Property
VALUES('8878 Essex St', 'Rama Gustav', 696185);

INSERT INTO Property
VALUES('7075 Winding Way St', 'Julita Onyekachi', 224324);

INSERT INTO Property
VALUES('805 West Silver Spear Ave', 'Leobwin Laxmi', 791938);

INSERT INTO Property
VALUES('7385 Boston St', 'Nirmala Dumuzi', 155993);

INSERT INTO Property
VALUES('263 Summer Rd', 'Tin Mario', 713525);

INSERT INTO Property
VALUES('8528 Maple Road', 'Adele Akosua', 277913);


/*6 house records*/

INSERT INTO House
VALUES(3,2,2000,'8878 Essex St', 'Rama Gustav', 249999);

INSERT INTO House
VALUES(3,2,3000,'7075 Winding Way St', 'Julita Onyekachi', 224324);

INSERT INTO House
VALUES(5,3,6000,'805 West Silver Spear Ave', 'Leobwin Laxmi', 791938);

INSERT INTO House
VALUES(2,1,1000,'7385 Boston St', 'Nirmala Dumuzi', 155993);

INSERT INTO House
VALUES(5,4,8500,'263 Summer Rd', 'Tin Mario', 713525);

INSERT INTO House
VALUES(3,1,1500,'8528 Maple Road', 'Adele Akosua', 277913);

/* 6 Business Property records */

INSERT INTO BusinessProperty
VALUES('Store', 2250, '9422 Devon St', 'Uma August', 825065);

INSERT INTO BusinessProperty
VALUES('Gas', 3250, '618 Catherine Ave', 'Karina Xenocrates', 657571);

INSERT INTO BusinessProperty
VALUES('Gas', 1250, '103 East Willow Rd', 'Andon Erebus', 743940);

INSERT INTO BusinessProperty
VALUES('Office', 7250, '781 Essex Avenue', 'Yuri Jacob', 810268);

INSERT INTO BusinessProperty
VALUES('Office', 5250, '9640 Woodsman Rd', 'Arushi Darrell', 580854);

INSERT INTO BusinessProperty
VALUES('Store', 4250, '8566 Brickell St', 'Lyudmila Ogden', 301557);

/* 6 Firm records */

INSERT INTO Firm
VALUES(14, 'Walmart', '100 Derp Street');

INSERT INTO Firm
VALUES(3, 'Target', '1350 Target way');

INSERT INTO Firm
VALUES(20, 'ChickFila', '7290 Arnold Ave');

INSERT INTO Firm
VALUES(47, 'Amazon', '8012 West Amerige Street');

INSERT INTO Firm
VALUES(28, 'Twitter', '399 Catherine Street');

INSERT INTO Firm
VALUES(19, 'Facebook', '1407 Cedarwood St');

/* 12 agent records */

INSERT INTO Agent
VALUES(147, 'Christiana Octavia', '8791263105', 14, '2011-10-17');

INSERT INTO Agent
VALUES(187, 'Linn Yvo', '3442796466', 14, '1999-12-23');

INSERT INTO Agent
VALUES(149, 'Kunti Helene', '4940784000', 3, '1998-01-14');

INSERT INTO Agent
VALUES(208, 'Heraclitus Tomomi', '7502546427', 3, '2002-11-03');

INSERT INTO Agent
VALUES(122, 'Prasad Dragos', '9450581907', 20, '2010-01-19');

INSERT INTO Agent
VALUES(190, 'Meiriona Ceolmund', '6798248089', 20, '2014-09-08');

INSERT INTO Agent
VALUES(235, 'Higuel Tatiana', '3734088408', 47, '2003-01-17');

INSERT INTO Agent
VALUES(250, 'Wahunsenacawh Gavrilo', '1323799357', 47, '1998-05-03');

INSERT INTO Agent
VALUES(117, 'Unice Odo', '4499059842', 28, '1997-02-14');

INSERT INTO Agent
VALUES(347, 'Matleena Per', '3911636827', 28, '2016-04-22');

INSERT INTO Agent
VALUES(825, 'Sundar Meadhbh', '7190790002', 19, '2018-10-19');

INSERT INTO Agent
VALUES(13, 'Vahagn Alkiviadis', '6487686450', 19, '2005-07-21');

/*12 Listings*/

INSERT INTO Listings
VALUES('9422 Devon St', 147, 3899, '2012-10-17');

INSERT INTO Listings
VALUES('618 Catherine Ave', 187, 4555, '2013-09-13');

INSERT INTO Listings
VALUES('103 East Willow Rd', 149, 1777, '2009-11-18');

INSERT INTO Listings
VALUES('781 Essex Avenue', 208, 7066, '2014-08-19');

INSERT INTO Listings
VALUES('9640 Woodsman Rd', 122, 7855, '2014-12-11');

INSERT INTO Listings
VALUES('8566 Brickell St', 190, 8166, '2016-12-20');

INSERT INTO Listings
VALUES('8878 Essex St', 235, 1266, '2008-02-23');

INSERT INTO Listings
VALUES('7075 Winding Way St', 250, 3166, '2014-10-22');

INSERT INTO Listings
VALUES('805 West Silver Spear Ave', 117, 8455, '2019-01-13');

INSERT INTO Listings
VALUES('7385 Boston St', 347, 7068, '2020-11-06');

INSERT INTO Listings
VALUES('263 Summer Rd', 825, 6288, '2021-11-25');

INSERT INTO Listings
VALUES('8528 Maple Road', 13, 7544, '2022-04-20');


/* 6 Buyer */
INSERT INTO Buyer
VALUES(9574, 'Anselm Gawain', '1797422349', 'house', 3, 2, 'NA', 210025, 860853);

INSERT INTO Buyer
VALUES(7635, 'Vincent Vadimir', '8493424098', 'house', 5, 3, 'NA', 215931, 856023);

INSERT INTO Buyer
VALUES(2938, 'Etsuko Thyge', '4260311728', 'NA', 0, 0, 'Office', 167836, 763303);

INSERT INTO Buyer
VALUES(6050, 'Lilias Mohammad', '2999064483', 'house', 6, 4, 'NA', 199729, 830224);

INSERT INTO Buyer
VALUES(6098, 'Asterix Mato', '9595595367', 'NA', 0, 0, 'Office', 141358, 992326);

INSERT INTO Buyer
VALUES(2626, 'Jordana Wulfwynn', '6285582923', 'NA', 0, 0, 'Office', 118479, 768366);

/* 6 Works With */
INSERT INTO Works_With
VALUES(9574, 147);

INSERT INTO Works_With
VALUES(7635, 187);

INSERT INTO Works_With
VALUES(2938, 208);

INSERT INTO Works_With
VALUES(6050, 122);

INSERT INTO Works_With
VALUES(6098, 347);

INSERT INTO Works_With
VALUES(2626, 13);