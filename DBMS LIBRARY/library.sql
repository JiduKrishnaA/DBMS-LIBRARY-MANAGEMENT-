CREATE TABLE book (book_id int, title varchar(25), language_name varchar(25), publisher_id int, published_date date, 
volume_no int, price float, status varchar(25));

CREATE TABLE author (author_id int, author_name varchar(25), phone_number int, email_id varchar(25), status varchar(25));

CREATE TABLE publisher (publisher_id int, publisher_name varchar(25), address varchar(25));

CREATE TABLE book_author (book_id int, author_id int);


CREATE TABLE users (user_id int, user_name varchar(25), branch_code varchar(25),  phone_number int, email_id varchar(25), 
date_of_join date, status varchar(25));

CREATE TABLE book_issued (issue_id int, date_of_issue date, book_id int, user_id int, expected_return_date date,
status varchar(25));

CREATE TABLE book_return (issue_id int, actual_return_date date, latedays int);

CREATE TABLE languages (language_name varchar(25));

SHOW TABLES;

-- Setting up key contraints 

ALTER TABLE languages add primary key (language_name);
ALTER TABLE book add constraint book_language foreign key (language_name) references languages(language_name) on delete cascade;

ALTER TABLE publisher add primary key (publisher_id);
ALTER TABLE book add constraint book_publisher foreign key (publisher_id) references publisher(publisher_id) on delete cascade;

ALTER TABLE author add primary key (author_id);
ALTER TABLE book_author add constraint book_author_name foreign key (author_id) references author(author_id) on delete cascade;

ALTER TABLE book add primary key (book_id);
ALTER TABLE book_issued add constraint issued_book foreign key (book_id) references book(book_id) on delete cascade;

ALTER TABLE users add primary key (user_id);
ALTER TABLE book_issued add constraint issued_to_user foreign key (user_id) references users(user_id) on delete cascade;

ALTER TABLE book_issued add primary key (issue_id);
ALTER TABLE book_return add constraint return_book_issued foreign key (issue_id) references book_issued(issue_id) on delete cascade;

 
