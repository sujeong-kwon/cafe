CREATE TABLE Category(
	cid			BIGINT			PRIMARY KEY AUTO_INCREMENT,
	cname		VARCHAR(20)	    NOT NULL,
	regDate		TIMESTAMP		NOT NULL DEFAULT CURRENT_TIMESTAMP
)AUTO_INCREMENT = 1;

CREATE TABLE MenuItem(
	mid				BIGINT			PRIMARY KEY AUTO_INCREMENT,
	mname			VARCHAR(20)		NOT NULL,
	price			DOUBLE			NOT NULL DEFAULT 0.0,
	stock			INT				NOT NULL DEFAULT 0,
	categoryId		BIGINT			NOT NULL,
	image			VARCHAR(200)	NOT NULL,
	regDate			TIMESTAMP	NOT NULL DEFAULT CURRENT_TIMESTAMP,
	
	CONSTRAINT MenuItem_categoryId_FK
		FOREIGN KEY(categoryId) REFERENCES Category(cid)
)AUTO_INCREMENT = 1001;

drop table category;
drop table menuitem;

insert into Category (cname) values("커피");
insert into Category (cname) values("음료");
insert into Category (cname) values("프라푸치노");

SELECT * FROM Category;

SELECT * FROM MenuItem;

delete from menuitem;

SELECT c.cid, c.name, m.mid, m.name, m.price, m.stock, m.categoryId, m.image_url FROM Category c INNER JOIN MenuItem m ON c.cid = m.categoryId WHERE m.categoryId = 1;

SELECT mid, mname, price, stock, categoryId, image FROM MenuItem;