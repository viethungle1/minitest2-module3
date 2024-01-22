create database minitest2;
use minitest2;
create table city(
id int auto_increment primary key,
city_name varchar (255));
insert into city value (1,"Ha Noi");
insert into city(city_name) values ("Ho Chi Minh"),
("Da Nang"),
("Hue"),
("Binh Duong");
create table categoryTour(
id int auto_increment primary key,
categoryCode varchar(255),
categoryName varchar(255));
insert into categoryTour values (1,"001","Tron goi"),
(2,"002","Tu chon");
create table destination(
id int auto_increment primary key,
destinationName varchar(255),
desribes varchar(255),
cost int,
city_id int,
foreign key (city_id) references city(id));
insert into destination values(1,"Ho Guom","A",100,1),
(2,"Thao Cam Vien","B",120,2),
(3,"Cau Rong","C",90,3),
(4,"Co Do","D",150,4),
(5,"Dung Lo Voi","E",200,5);
create table clients (
id int auto_increment primary key,
nameClient varchar(255),
idNumber varchar(255),
dateBirth date,
city_id int,
foreign key (city_id) references city(id));
insert into clients value(1, "Phan Quyet Thang", "0123456789","1999-1-1",1);
insert into clients(nameClient, idNumber, dateBirth, city_id) values ("Duong Minh Hieu", "0123456788", "2000-1-1",2),
("Le Viet Hung", "0123456787", "1996-1-1",3),
("Do An Nhu", "0123456786", "2003-1-1",4),
("Trinh Luu Khoa", "0123456785", "2001-1-1",5),
("Tran Tuan Anh", "0123456784", "1993-1-1",5),
("Nguyen Thanh Hai", "0123456783", "1996-1-1",4),
("Vu Anh Duy", "0123456782", "1996-2-1",3),
("Nguyen Dinh Thong", "0123456781", "1993-2-1",2),
("Nguyen Dinh Phong", "0123456780", "2003-2-1",2);
select * from clients;
create table tour(
id int auto_increment primary key,
tourCode varchar(255),
category_id int,
destination_id int,
dateStart date,
dateEnd date,
foreign key (category_id) references categoryTour(id),
foreign key (destination_id) references destination(id));
insert into tour values (1,"HN",1,1,"2024-1-1","2024-1-3");
insert into tour(tourCode, category_id, destination_id, dateStart, dateEnd) values ("HCM",2,2,"2024-1-1","2024-1-3"),
("DN",2,3,"2024-1-1","2024-1-3"),
("HE",2,4,"2024-1-1","2024-1-3"),
("BD",2,5,"2024-1-1","2024-1-3"),
("HN",1,1,"2024-2-1","2024-2-3"),
("HCM",1,2,"2024-2-1","2024-2-3"),
("DN",1,3,"2024-2-1","2024-2-3"),
("HE",1,4,"2024-2-1","2024-2-3"),
("BD",1,5,"2024-2-1","2024-2-3"),
("HN",1,1,"2024-3-1","2024-3-3"),
("HCM",1,2,"2024-3-1","2024-3-3"),
("DN",1,3,"2024-3-1","2024-3-3"),
("HE",1,4,"2024-3-1","2024-3-3"),
("BD",1,5,"2024-3-1","2024-3-3");
select * from tour;
create table ordertour(
id int auto_increment primary key,
tour_id int,
clients_id int,
status varchar(255),
foreign key (tour_id) references tour(id),
foreign key (clients_id) references clients(id));
insert into ordertour values (1,5,7,"close");
insert into ordertour(tour_id,clients_id,status) values (8,3,"close"),
(1,6,"close"),
(10,2,"close"),
(12,9,"close"),
(13,4,"active"),
(4,5,"active"),
(6,7,"active"),
(5,8,"active"),
(9,10,"active");
select * from ordertour;
-- Thống kê số lượng tour của các thành phố
select c.city_name, count(t.id) as so_luong_tour from city c left join destination d on c.id = d.city_id join tour t on d.id = t.destination_id group by c.id;
