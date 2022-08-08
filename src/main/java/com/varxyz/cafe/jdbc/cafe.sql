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

create table Cart(
    cartId  		BIGINT 	PRIMARY KEY AUTO_INCREMENT,
    amount 			INT		NOT NULL DEFAULT 0,
    menuItemId		BIGINT  NOT NULL,
    
    CONSTRAINT Cart_menuItemId_FK
		FOREIGN KEY(menuItemId) REFERENCES MenuItem(mid)
);

SELECT c.cartId, c.amount, c.menuItemId, m.mid, m.mname, m.price, m.stock, m.categoryId FROM Cart c INNER JOIN MenuItem m ON m.mid = c.menuItemId;

drop table category;
drop table menuitem;
drop table cart;

insert into Category (cname) values("커피");
insert into Category (cname) values("음료");
insert into Category (cname) values("프라푸치노");

SELECT * FROM Category;

SELECT * FROM MenuItem;

SELECT * FROM Cart;

delete from menuitem;

delete from Cart;

SELECT c.cid, c.name, m.mid, m.name, m.price, m.stock, m.categoryId, m.image_url FROM Category c INNER JOIN MenuItem m ON c.cid = m.categoryId WHERE m.categoryId = 1;

SELECT mid, mname, price, stock, categoryId, image FROM MenuItem;

SELECT COUNT(*) FROM Cart menuItemId WHERE menuItemId=1001;