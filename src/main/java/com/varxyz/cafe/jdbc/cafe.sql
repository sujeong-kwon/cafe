CREATE TABLE Category(
	cid			BIGINT			PRIMARY KEY AUTO_INCREMENT,
	ctype		CHAR(1)			NOT NULL DEFAULT 'C',
	regDate		TIMESTAMP		NOT NULL	DEFAULT CURRENT_TIMESTAMP 
)AUTO_INCREMENT = 1001;

CREATE TABLE MenuItem(
	mid				BIGINT		PRIMARY KEY AUTO_INCREMENT,
	name			VARCHAR(20)		NOT NULL,
	price			DOUBLE		NOT NULL DEFAULT 0.0,
	stock			INT			NOT NULL DEFAULT 0,
	categoryId		BIGINT		NOT NULL,
	regDate			TIMESTAMP	NOT NULL DEFAULT CURRENT_TIMESTAMP,
	
	CONSTRAINT MenuItem_categoryId_FK
		FOREIGN KEY(categoryId) REFERENCES Category(cid)
)AUTO_INCREMENT = 2001;


SELECT * FROM Category;

SELECT * FROM MenuItem;

delete from customer where cid=1018;

SELECT * FROM Customer WHERE email = "example@example" AND passwd = "1122";

DELETE FROM Customer WHERE cid=1002;

INSERT INTO Customer (email, passwd, name, ssn, phone)
VALUES ("ee", "123", "ee", "ee", "ee");

DROP TABLE Account;

SELECT * FROM Account;

delete from customer;

select * from account where customerId=1031;

UPDATE Account SET balance=2000 WHERE aid=3007;

SELECT a.aid, a.accountNum, a.balance, a.interestRate, a.overAmount, a.accType, c.name, c.ssn, c.phone, a.regDate FROM Account a INNER JOIN Customer c ON a.customerId = c.cid WHERE c.ssn = '800111-1234567';