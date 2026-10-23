CREATE TABLE Customer (
  Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
    FName NVARCHAR(50) NOT NULL,
    LName NVARCHAR(50) NOT NULL,
    Email VARCHAR(254) NOT NULL UNIQUE,
    Password_Hash VARCHAR(255) NOT NULL,
    Phone VARCHAR(40),
    Created_At DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);


CREATE TABLE ADDRESS (
Address_ID INT IDENTITY (1,1) Primary Key,
Customer_ID int Not NULL Unique
Foreign Key References Customer(Customer_ID),
Street Nvarchar(50) not null ,
City Nvarchar(50) not null ,
Postolcode varchar(20) not null,
Country Nvarchar(50) not null
);




Create TABLE Category (
Category_ID int Identity(1,1) Primary Key ,
name nvarchar(50) not null,
description nvarchar(250),
Category_Parent_ID int,

CONSTRAINT FK_CATEGORY_PARENT
Foreign Key (Category_Parent_ID)
References Category(Category_ID)
);

CREATE TABLE Product(
Product_ID int Identity (1,1) Primary Key,
Category_ID int,
name nvarchar(50) not null,
description nvarchar(250),
Price Decimal (6,2) not null check (Price >=0),
Stock_Qty int not null check (Stock_Qty >=0) ,
Sku varchar(50) not null unique , 
Is_active BIT not null  ,
Created_At DATETIME2 NOT NULL DEFAULT SYSDATETIME() ,

CONSTRAINT FK_CATEGOREY_ID
foreign key (Category_ID )
references Category(Category_ID)
);
alter table Product
Alter Column Category_ID int not null ;

CREATE TABLE Orders(
Order_ID int identity (1,1) Primary Key,
Customer_ID int,
Address_ID int ,
Order_Date DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
Status bit not null ,
TotalAmount Decimal(10,2) Not NULL,

CONSTRAINT FK_CUSTOMER_ID
foreign key (Customer_ID)
references Customer (Customer_ID)
,
CONSTRAINT Address_ID
foreign key (Address_ID)
references ADDRESS(Address_ID)
);
alter table Orders
alter column Customer_ID INT NOT NULL

alter table Orders
alter column Address_ID INT NOT NULL

CREATE TABLE Order_Item(
Product_ID int not null,
Order_ID int not null ,
Quantity int not null,
Unit_Price Decimal(10,2),

CONSTRAINT PK_ORDERID_PRODUCTID
primary Key (Product_ID,Order_ID)
,
	CONSTRAINT FK_ORDER_ID
	foreign key (Order_ID)
	references Orders (Order_ID)
,
	CONSTRAINT FK_Product_ID
	foreign key (Product_ID)
	references Product (Product_ID)
);

CREATE TABLE CART(
CART_ID int identity (1,1) not null,
Customer_ID int ,
Created_At DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

CONSTRAINT FK_CUSTOMERID 
foreign key (Customer_ID)
references Customer(Customer_ID)
);

alter table CART
alter column Customer_ID INT NOT NULL;


alter Table CART
Add Constraint PK_CART_ID
primary key (CART_ID)



CREATE TABLE CART_ITEM(
CART_ID int ,
Product_Id int,
Quantity int check (Quantity >=0),

CONSTRAINT FK_CART_ID
foreign key (CART_ID)
references CART(CART_ID)
,
CONSTRAINT FKProductID
foreign key (Product_ID)
references Product(Product_ID)
);


CREATE TABLE Payment(
Payment_ID int identity (1,1) primary key,
Method Nvarchar(30) not null,
amount decimal(10,2) not null,
Order_ID int ,
Status bit not null,
Payment_Date DATETIME2 NOT NULL Default SYSDATETIME(),

CONSTRAINT FKORDER_ID
foreign key (Order_ID)
references Orders(Order_ID)
);

alter table Payment
alter column Order_ID INT NOT NULL;

CREATE TABLE Shipment(

Shipment_ID int identity (1,1) Primary key ,
Order_ID int ,
Carrier Nvarchar(30) not null,
Tracking_no varchar(20) not null unique ,
status bit not null ,
shiping_cost decimal (6,2) not null ,
shpining_date DateTime2 not null default sysdatetime(),
estimited_delivery_date date,
delivery_date date

Constraint ForeigenKey_OrderId
foreign key (Order_ID)
references Orders(Order_ID)
);

alter table Shipment
alter column Order_ID INT NOT NULL;

CREATE TABLE Review (
    Review_ID INT IDENTITY(1,1) PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating Between 1 and 5),
    Comments NVARCHAR(500),
    Review_Date DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    CONSTRAINT FK_Review_Customer
        FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),

    CONSTRAINT FK_Review_Product
        FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),

    CONSTRAINT UQ_Review_Customer_Product
        UNIQUE (Customer_ID, Product_ID)
);