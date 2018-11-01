USE testdb;

CREATE TABLE `itemlist` (
  `i_name` varchar(100) NOT NULL,
  `i_price` int(20) DEFAULT NULL,
  `sale_rate` double DEFAULT 0,
  PRIMARY KEY (`i_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into `testdb`.`itemlist`(`i_name`,`i_price`,`sale_rate`) values ('전주 삼각김밥',800,0.3);
