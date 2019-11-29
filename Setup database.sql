-- remove foreign key constraints
ALTER TABLE Födelsedatum
DROP CONSTRAINT FK_Far

ALTER TABLE Födelsedatum
DROP CONSTRAINT FK_Mor

ALTER TABLE Hundar
DROP CONSTRAINT FK_Födelsedatum

ALTER TABLE Hundar
DROP CONSTRAINT FK_Ägare
GO

-- är medveten om att man inte bör använda * men gör det för enkelhetens skull
CREATE OR ALTER PROCEDURE GetAllDogs
AS
SELECT
	*
FROM
	Hundar
	GO

-- drop tables
DROP TABLE Födelsedatum
DROP TABLE Uppfödare
DROP TABLE Raser
DROP TABLE Hundar
DROP TABLE Ägare
DROP TABLE Veterinärdata
DROP TABLE Veterinärer


-- create table Ägare
CREATE TABLE Ägare
(
	Id   int     PRIMARY KEY IDENTITY(1,1),
	Namn  varchar(50) NOT NULL,
	Adress varchar(50) NOT NULL,
	Telefon varchar(50) NOT NULL,
	Mobil  varchar(50),
	ArbTele varchar(50)
)

INSERT INTO Ägare
	(
	Namn,
	Adress,
	Telefon,
	Mobil,
	ArbTele
	)
VALUES
	(
		'Jorvén Pär',
		'Ribbingsgatan 14 504 66 Borås',
		'033-412180',
		'070-8697048',
		'0325-669048'
  )


-- create table Raser
CREATE TABLE Raser
(
	Id  int     PRIMARY KEY IDENTITY(1,1),
	Namn varchar(50) NOT NULL
)
INSERT INTO Raser
	(Namn)
SELECT
	Namn
FROM
	skk.dbo.Raser


-- create table Uppfödare
CREATE TABLE Uppfödare
(
	Id   int     PRIMARY KEY IDENTITY(1,1),
	Kennel varchar(50) NOT NULL,
	Namn  varchar(50) NOT NULL,
	Ort  varchar(50) NOT NULL
)
INSERT INTO Uppfödare
	(
	Kennel,
	Namn,
	Ort
	)
VALUES
	(
		'Jockes Jyckar',
		'Joakim Kvist',
		'Helsingborg'
)


-- create tables Födelsedatum
CREATE TABLE Födelsedatum
(
	Id      int PRIMARY KEY IDENTITY(1,1),
	Födelsedatum date NOT NULL,
	Far_Id    int NOT NULL,
	Mor_Id    int NOT NULL
)
-- insert date of birth för Lissmas
INSERT INTO Födelsedatum
	(Födelsedatum, Far_Id, Mor_Id)
VALUES
	('2005-06-08', 5553, 5554)
-- some more
INSERT INTO Födelsedatum
	(Födelsedatum, Far_Id, Mor_Id)
VALUES
	('2015-02-08', 53, 584)
INSERT INTO Födelsedatum
	(Födelsedatum, Far_Id, Mor_Id)
VALUES
	('2014-02-08', 223, 24)



-- create table Veterinärdata
CREATE TABLE Veterinärdata
(
	Id         int     PRIMARY KEY IDENTITY(1,1),
	UndersökningsDatum date    NOT NULL,
	Resultat      varchar(50) NOT NULL,
	Veterinär_Id    int     NOT NULL,
	Hund_Id      int     NOT NULL
)
-- insert veterinary data
INSERT INTO Veterinärdata
	(UndersökningsDatum, Resultat, Veterinär_Id, Hund_Id)
VALUES
	('2006-12-15', '	HD grad A', 1, 5553)
INSERT INTO Veterinärdata
	(UndersökningsDatum, Resultat, Veterinär_Id, Hund_Id)
VALUES
	('2006-12-15', 'patella, ua', 2, 5553)


-- create table Veterinärer
CREATE TABLE Veterinärer
(
	Id  int     PRIMARY KEY IDENTITY(1,1),
	Namn varchar(50) NOT NULL
)
-- insert veterinaries
INSERT INTO Veterinärer
	(Namn)
VALUES
	('Blå Stjärnans Djursjukhus Borås')
INSERT INTO Veterinärer
	(Namn)
VALUES
	('Af Klinteberg Anna-Carin')
INSERT INTO Veterinärer
	(Namn)
VALUES
	('Benny Brun Djurklinik')
INSERT INTO Veterinärer
	(Namn)
VALUES
	('Kalle Ankas Fågelsjukhus')
INSERT INTO Veterinärer
	(Namn)
VALUES
	('Ylvar Yxa Djurakuten')
INSERT INTO Veterinärer
	(Namn)
VALUES
	('Djurens Vänner Sjuhärad')


-- create table Hundar
CREATE TABLE Hundar
(
	Id       int     PRIMARY KEY IDENTITY(1,1),
	Namn      varchar(50) NOT NULL,
	Ras       varchar(50),
	Kön       varchar(1),
	Färg      varchar(20),
	Storlek     varchar(6),
	Hårlag     varchar(30),
	TT_Id      varchar(15),
	ChipNr     varchar(30) NOT NULL,
	Födelsedatum_Id int     NOT NULL,
	Ägar_Id     int     NOT NULL,
	Uppfödare_Id  int     NOT NULL,
	Saknad     bit,
	Hittad     bit
)


-- create Lissmas Fantasia-Li
INSERT INTO Hundar
	(Namn, Ras, Kön, Färg, Storlek, Hårlag, TT_Id, ChipNr, Födelsedatum_Id, Uppfödare_Id, Ägar_Id)
VALUES('S45925/2005 Lissmas Fantasia-Li', 'Parson russell terrier', 'T', 'vit',
		'36cm', 'sträv', '12345', '977200004100436', 1, 1, 1)
-- create Lissmas Fantasia-Li sister
INSERT INTO Hundar
	(Namn, Ras, Kön, Färg, Storlek, Hårlag, TT_Id, ChipNr, Födelsedatum_Id, Uppfödare_Id, Ägar_Id, Saknad)
VALUES('S45922/2005 Lissmas Fanny', 'Parson russell terrier', 'T', 'vit',
		'33cm', 'sträv', '123435', '977200045100436', 1, 1, 1, 1)
-- create father
INSERT INTO Hundar
	(Namn, Ras, Kön, Färg, Storlek, Hårlag, TT_Id, ChipNr, Födelsedatum_Id, Uppfödare_Id, Ägar_Id)
VALUES('S35194/96 Honeyfarms Yvund Kevin', 'Parson russell terrier', 'T', 'grå',
		'38cm', 'sträv', '34324', '977233304100436', 2, 3, 2)
-- create mother
INSERT INTO Hundar
	(Namn, Ras, Kön, Färg, Storlek, Hårlag, TT_Id, ChipNr, Födelsedatum_Id, Uppfödare_Id, Ägar_Id)
VALUES('S35580/97 Jackies Terrific Contessa', 'Parson russell terrier', 'T', 'vit',
		'34cm', 'sträv', '34567', '977205554100436', 3, 6, 3)

UPDATE Hundar SET Ägar_Id = 1500 WHERE id = 1


-- add foreign keys to Födelsedatum
ALTER TABLE Födelsedatum
ADD CONSTRAINT FK_Far 
FOREIGN KEY (Far_Id) REFERENCES Hundar(Id)

ALTER TABLE Födelsedatum
ADD CONSTRAINT FK_Mor FOREIGN KEY (Mor_Id) REFERENCES Hundar(Id)

-- add foreign keys to Hundar
ALTER TABLE Hundar
ADD CONSTRAINT FK_Födelsedatum
FOREIGN KEY (Födelsedatum_Id) REFERENCES Födelsedatum(Id)

ALTER TABLE Hundar
ADD CONSTRAINT FK_Ägare
FOREIGN KEY (Ägar_Id) REFERENCES Ägare(Id)

-- add foreign keys to Veterinärdata
ALTER TABLE Veterinärdata
ADD CONSTRAINT FK_Hund_Id
FOREIGN KEY (Hund_Id) REFERENCES Hundar(Id)

ALTER TABLE Veterinärdata
ADD CONSTRAINT FK_Veterinär_Id
FOREIGN KEY (Veterinär_Id) REFERENCES Veterinärer(Id)
GO


--- STORED PROCEDURES ---

-- Count dogs
CREATE OR ALTER PROCEDURE CountAllDogs
AS
SELECT
	COUNT(*) AS int
FROM
	Hundar
GO

EXEC CountAllDogs
GO

-- Count veterinary data
CREATE OR ALTER PROCEDURE CountVeterinaryData
AS
SELECT
	COUNT(*)
FROM
	Veterinärdata
GO

EXEC CountVeterinaryData
GO


-- Dog info
CREATE OR ALTER PROCEDURE GetDogInfo
	(@Id int)
AS
SELECT
	H1.Namn,
	Far.Namn AS Far,
	Mor.Namn AS Mor,
	H1.Ras,
	H1.Kön,
	H1.Storlek,
	H1.Hårlag,
	H1.TT_Id AS 'Tat/tång-ID',
	H1.ChipNr AS 'Chip-nr',
	H1.Färg
FROM
	Hundar H1
	INNER JOIN Födelsedatum ON H1.Födelsedatum_Id = Födelsedatum.Id
	INNER JOIN Hundar Far ON Far.Id = Födelsedatum.Far_Id
	INNER JOIN Hundar Mor ON Mor.Id = Födelsedatum.Mor_Id
WHERE H1.Id = @Id
GO

EXEC GetDogInfo 9
GO


-- Search dog
CREATE OR ALTER PROCEDURE SearchDog
	@Regnr varchar(30),
	@TT_Id varchar(15),
	@ChipNr varchar(30),
	@Namn varchar(50) = NULL,
	@Ras varchar(50) = NULL,
	@Kön varchar(1) = NULL
AS
SELECT
	Namn,
	TT_Id AS 'Tat/tång-ID',
	ChipNr AS 'Chip-nr',
	Ras,
	Kön
FROM
	Hundar
WHERE Namn LIKE '%' + @Regnr + '%' OR
	TT_Id LIKE '%' + @TT_Id + '%' OR
	ChipNr LIKE '%' + @ChipNr + '%' OR
	Namn LIKE '%' + @Namn + '%' OR
	Ras LIKE '%' + @Ras + '%' OR
	Kön = @Kön 
GO

EXEC SearchDog @Regnr = NULL, @TT_Id = NULL, @ChipNr = NULL, @Namn = NULL, @Ras = NULL, @Kön = NULL
GO


-- Search owner
CREATE OR ALTER PROCEDURE FindOwner
	@Id int
AS
SELECT
	Namn,
	Adress,
	Telefon,
	Mobil,
	ArbTele AS 'Arb.Tele'
FROM
	Ägare
WHERE Id = @Id
GO

EXEC FindOwner @Id = 1
GO

-- Register owner
CREATE OR ALTER PROCEDURE AddOwner
	@Namn varchar(50),
	@Adress varchar(50),
	@Telefon varchar(50),
	@Mobil varchar(50) = NULL,
	@ArbTele varchar(50) = NULL

AS
INSERT INTO Ägare
	(
	Namn,
	Adress,
	Telefon,
	Mobil,
	ArbTele
	)
VALUES
	(
		@Namn,
		@Adress,
		@Telefon,
		@Mobil,
		@ArbTele
  )
GO

EXEC AddOwner 'Nils', 'Gata 5', '12234'
GO

-- Change owner
CREATE OR ALTER PROCEDURE ChangeOwner
	@OldOwner_Id int,
	@NewOwner_Id int
AS
UPDATE Hundar
SET Ägar_Id = @NewOwner_Id
WHERE Ägar_Id = @OldOwner_Id
GO

EXEC ChangeOwner 1, 2
GO

-- Register dog
CREATE OR ALTER PROCEDURE AddDog
	@Namn      varchar(50),
	@Ras       varchar(50) = NULL,
	@Kön       varchar(1) = NULL,
	@Färg      varchar(20) = NULL,
	@Storlek     varchar(6) = NULL,
	@Hårlag     varchar(30) = NULL,
	@TT_Id      varchar(15) = NULL,
	@ChipNr     varchar(30),
	@Födelsedatum_Id int,
	@Ägar_Id     int
AS

INSERT INTO Hundar
	(Namn, Ras, Kön, Färg, Storlek, Hårlag, TT_Id,
	ChipNr, Födelsedatum_Id, Ägar_Id)
VALUES
	(@Namn, @Ras, @Kön, @Färg, @Storlek, @Hårlag,
		@TT_Id, @ChipNr, @Födelsedatum_Id, @Ägar_Id)
GO

EXEC AddDog @Namn = 'Pelle', @Ras = 'Tax', @Kön = 'T', @Färg = 'lila',
 @Storlek = '15cm', @Hårlag = 'sträv', @TT_Id = 123456, @ChipNr = 6465465,
	@Födelsedatum_Id = 1, @Ägar_Id = 12
GO

-- Search Kennel
CREATE OR ALTER PROCEDURE SearchKennel
	@Id int
AS
SELECT
	H.Namn,
	U.Kennel,
	U.Namn,
	U.Ort
FROM
	Uppfödare U
	INNER JOIN Hundar H ON U.Id = H.Uppfödare_Id
WHERE H.Id = @Id
GO

SELECT
	Namn,
	födelsedatum_id
FROM
	Hundar
SELECT
	*
FROM
	Födelsedatum
GO

-- Kullsyskon
CREATE OR ALTER PROCEDURE GetSyblings
AS
SELECT
	DISTINCT
	H1.Namn, H2.Namn
FROM
	Hundar H1,
	Hundar H2
WHERE H1.Födelsedatum_Id = H2.Födelsedatum_Id AND H1.Id = 9
GO
EXEC GetSyblings
GO