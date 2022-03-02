/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de cr�ation :  01/03/2022 12:30:44                      */
/*==============================================================*/


drop table if exists Customers;

drop table if exists OrderDetails;

drop table if exists Orders;

drop table if exists Products;

/*==============================================================*/
/* Table : Customers                                            */
/*==============================================================*/
create table Customers
(
   customerCode         int not null,
   lastName             varchar(100) not null,
   firstName            varchar(100) not null,
   adress               varchar(254) not null,
   phone                varchar(15) not null,
   email                varchar(254) not null,
   password             varchar(254) not null,
   primary key (customerCode)
);

/*==============================================================*/
/* Table : OrderDetails                                         */
/*==============================================================*/
create table OrderDetails
(
   orderID              int not null,
   productID            int not null,
   orderedQuantity      int,
   primary key (orderID, productID)
);

/*==============================================================*/
/* Table : Orders                                               */
/*==============================================================*/
create table Orders
(
   orderID              int not null,
   customerCode         int not null,
   orderDate            datetime,
   deliveryAddress      varchar(254),
   primary key (orderID)
);

/*==============================================================*/
/* Table : Products                                             */
/*==============================================================*/
create table Products
(
   productID            int not null,
   productName          varchar(254),
   description          varchar(254),
   unitPrice            numeric(8,0),
   quantityInStock      int,
   image                varchar(254),
   primary key (productID)
);

alter table OrderDetails add constraint FK_Contient foreign key (orderID)
      references Orders (orderID) on delete restrict on update restrict;

alter table OrderDetails add constraint FK_commande_dans foreign key (productID)
      references Products (productID) on delete restrict on update restrict;

alter table Orders add constraint FK_commander foreign key (customerCode)
      references Customers (customerCode) on delete restrict on update restrict;


Delete From OrderDetail;

Delete From Orders;

Delete From Products;

Delete From Customers;

