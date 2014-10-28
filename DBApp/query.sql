CREATE TABLE tblsawon(
	no			number,
	id			varchar2(20),
	name		varchar2(20),
	pass		varchar2(10),
	age			number(2),
	addr		varchar2(50),
	ext			char(4),
	dept		varchar2(10),
	CONSTRAINT	pk_no PRIMARY KEY(no)
);

CREATE SEQUENCE seq_no;

select * from TBLSAWON;

-- alt x
-- mysql
-- mysql -u root -p
-- CREATE DATABASE dbL3
-- use dbL3
-- show tables;

CREATE TABLE tblsawon(
	no			int		not null	auto_increment,
	id			varchar(20),
	name		varchar(20),
	pass		varchar(10),
	age			int,
	addr		varchar(50),
	ext			char(4),
	dept		varchar(10),
	CONSTRAINT	pk_no PRIMARY KEY(no)
);

INSERT INTO TBLSAWON(id, name, pass, age, addr, ext, dept) values('hong', '홍길동', '1111', 20, '서울', '3431', '영업');
INSERT INTO TBLSAWON(id, name, pass, age, addr, ext, dept) values('lim', '임꺽정', '2222', 29, '광주', '3432', '영업');
INSERT INTO TBLSAWON(id, name, pass, age, addr, ext, dept) values('lee', '이순신', '3333', 39, '부산', '3433', '영업');
INSERT INTO TBLSAWON(id, name, pass, age, addr, ext, dept) values('shin', '신돌석', '4444', 36, '서울', '3434', '기술');
INSERT INTO TBLSAWON(id, name, pass, age, addr, ext, dept) values('jang', '장보고', '5555', 20, '서울', '3435', '기술');
INSERT INTO TBLSAWON(id, name, pass, age, addr, ext, dept) values('ahn', '안창호', '6666', 34, '경기', '3436', '기획');
INSERT INTO TBLSAWON(id, name, pass, age, addr, ext, dept) values('yun', '윤봉길', '7777', 25, '경기', '3437', '기획');









