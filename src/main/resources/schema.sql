create table if not exists Ingredient
(
    id   varchar(4)  ,
    name varchar(25) ,
    type varchar(10)
);

create table if not exists Taco
(
    id        identity,
    name      varchar(50) ,
    createdAt timestamp
);

create table if not exists Taco_Ingredients
(
    taco       bigint     ,
    ingredient varchar(4)
);

alter table Taco_Ingredients
    add foreign key (taco) references Taco (id);
alter table Taco_Ingredients
    add foreign key (ingredient) references Ingredient (id);

create table if not exists Taco_Order
(
    id             identity,
    deliveryName   varchar(50) ,
    deliveryStreet varchar(50) ,
    deliveryCity   varchar(50) ,
    deliveryState  varchar(2)  ,
    deliveryZip    varchar(10) ,
    ccNumber       varchar(16) ,
    ccExpiration   varchar(5)  ,
    ccCVV          varchar(3)  ,
    placedAt       timestamp
);

create table if not exists Taco_Order_Tacos
(
    tacoOrder bigint ,
    taco      bigint
);

alter table Taco_Order_Tacos
    add foreign key (tacoOrder) references Taco_Order (id);
alter table Taco_Order_Tacos
    add foreign key (taco) references Taco (id);
