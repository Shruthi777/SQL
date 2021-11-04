use onlinestreaming3nf

CREATE TABLE user_info
( 
user_id varchar (10),
user_name varchar(20) NOT NULL,
UPassword varchar(10),
email varchar(20) NOT NULL,
phone_num int,
credit_card long NOT NULL,
primary key (user_id));
drop table user_info;

CREATE TABLE user_profile
(
profile_id varchar (10),
user_id varchar (10),
profile_name varchar (20) UNIQUE,
primary key (profile_id, user_id),
foreign key (user_id) references user_info(user_id));
drop table user_profile;

CREATE TABLE watch_later
(
profile_id varchar (10),
to_watch_list varchar(20),
foreign key (profile_id) references user_profile(profile_id));
drop table watch_later;

CREATE TABLE watch_history
(
profile_id varchar (10),
watch_history_list varchar (30),
foreign key (profile_id) references user_profile(profile_id));

drop table watch_history;

CREATE TABLE Devices_registered
(device_id varchar(10),
device_name varchar(20),
last_login time(0),
profile_id varchar(10),
primary key (device_id, profile_id),
foreign key (profile_id) references user_profile(profile_id));
drop table Devices_registered;

CREATE TABLE Shows
( show_id varchar(10),
show_type varchar(10),
genre varchar(10),
show_title varchar(10),
release_year int,
rating varchar(10),
duration varchar(10),
s_desc text,
primary key (show_id));
drop table Shows;

CREATE TABLE reviews
( show_id varchar(10),
profile_id varchar(10),
review text,
 primary key(show_id , profile_id),
foreign key (show_id) references Shows(show_id), 
foreign key (profile_id) references user_profile(profile_id));
drop table reviews;

CREATE TABLE subscription
(
user_id varchar(10) UNIQUE,
sub_ID varchar(10) UNIQUE,
sub_date timestamp,
sub_type varchar(10),
sub_price float,
primary key(user_id, sub_ID),
foreign key(user_id) references user_info(user_id));
drop table subscription
describe subscription

CREATE TABLE payment
(user_id varchar(10),
pay_ID varchar(10),
method_of_payment varchar(10),
payment_date timestamp,
price float,
primary key (pay_ID, user_id),
foreign key(user_id) references user_info(user_id),
foreign key(pay_id) references subscription(sub_id));
drop table payment


CREATE TABLE cast_role_in_show
(cast_id varchar(10),
show_id varchar(10),
role_played varchar(10),
primary key (cast_id, show_id),
foreign key(show_id) references Shows(show_id));
drop table cast_role_in_show

CREATE TABLE cast_id_name
(cast_id varchar(10),
cast_name varchar(10),
primary key (cast_id),
foreign key(cast_id) references cast_role_in_show(cast_id));


drop table cast_id_name;
