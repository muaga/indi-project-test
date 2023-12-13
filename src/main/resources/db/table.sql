create table payment_tb(
                           id int auto_increment primary key,
                           imp_uid varchar(100) not null unique,
                           merchant_uid varchar(100) not null,
                           name varchar(30) not null,
                           amount int not null,
                           buyer_name varchar(30) not null,
                           created_at timestamp not null default now()
);

create table refund_tb(
                          id int auto_increment primary key,
                          refung_name varchar(30) not null,
                          refund_amount int not null,
                          buyer_name varchar(30) not null,

                          refunded_at datetime not null default now(),
                          payment_id int not null,
                          foreign KEY(payment_id) references payment_tb(id)

);