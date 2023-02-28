create database ecommerce;
use ecommerce;
create table if not exists `supplier`(
`SUPP_ID` int primary key,
`SUPP_NAME` varchar(50) NOT NULL,
`SUPP_CITY` varchar(50),
`SUPP_PHONE` varchar(50) NOT NULL
);

create table if not exists `customer`(
`CUS_ID` int NOT NULL primary key,
`CUS_NAME` varchar(20) NOT NULL,
`CUS_PHONE` varchar(10) NOT NULL,
`CUS_CITY` varchar(30) NOT NULL,
`CUS_GENDER` char
);

create table if not exists `category`(
`CAT_ID` int NOT NULL primary key,
`CAT_NAME` varchar(20) NOT NULL
);

create table if not exists `product`(
`PRO_ID` int NOT NULL primary key,
`PRO_NAME` varchar(20) NOT null default "Dummy Product",
`PRO_DESC` varchar(60),
`CAT_ID` int not null,
FOREIGN KEY(`CAT_ID`) REFERENCES CATEGORY(`CAT_ID`)
);

CREATE TABLE IF NOT EXISTS `supplier_pricing`(
`PRICING_ID` int not null primary key,
`PRO_ID` int not null,
`SUPP_ID` int not null,
`SUPP_PRICE` INT DEFAULT 0,
foreign key(`PRO_ID`) REFERENCES PRODUCT(`PRO_ID`),
 FOREIGN KEY(`SUPP_ID`) REFERENCES SUPPLIER(`SUPP_ID`)
);

create table if not exists `order`(
`ORD_ID` int not null primary key,
`ORD_AMOUNT` INT NOT NULL,
`ORD DATE` DATE,
`CUS_ID` INT NOT NULL,
`PRICING_ID` INT NOT NULL,
FOREIGN KEY(`CUS_ID`) REFERENCES CUSTOMER(`CUS_ID`),
foreign key(`PRICING_ID`) REFERENCES SUPPLIER_PRICING(`PRICING_ID`) 
);

CREATE TABLE IF NOT EXISTS `rating`(
`RAT_ID` int not null primary key,
`ORD_ID` INT NOT NULL,
`RAT_RATSTARS` INT NOT NULL,
foreign key(`ORD_ID`) REFERENCES `ORDER`(`ORD_ID`) 
);





