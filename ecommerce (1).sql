USE ecommerce;
CREATE TABLE User1(
  UserID VARCHAR(8) NOT NULL,
  USER_TYPE VARCHAR(1) NOT NULL,
  DateCreated DATE NOT NULL,
  PRIMARY KEY (UserID)
  );
-- Users can be buyers and sellers but will have different accounts. 

CREATE TABLE Buyer(
  BuyerID VARCHAR(8) NOT NULL,
  UserID VARCHAR(8) NOT NULL,
  Membership VARCHAR(1) NOT NULL,
  BuyerFirstName VARCHAR(50) NOT NULL,
  BuyerLastName VARCHAR(50) NULL,
  PhoneNumber VARCHAR(15) DEFAULT 'xxx-xxx-xxxx' NOT NULL,
  Email VARCHAR(50) NOT NULL,
  PRIMARY KEY (UserID)
  );
  
CREATE TABLE Seller (
  SellerID VARCHAR(8) NOT NULL,
  UserID VARCHAR(8) NOT NULL,
  CompanyName VARCHAR(50) NOT NULL,
  SellerFirstName VARCHAR(50) NOT NULL,
  SellerLastName VARCHAR(50) NOT NULL,
  PhoneNumber VARCHAR(15) DEFAULT 'xxx-xxx-xxxx' NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Logo BLOB NULL,
  PRIMARY KEY (UserID));
  

CREATE TABLE Address (
  AddressID VARCHAR(8) NOT NULL,
  UserID VARCHAR(8) NOT NULL,
  Address_Type VARCHAR(20) NOT NULL,
  AddressLine1 VARCHAR(50) NULL,
  City VARCHAR(50) NULL,
  Province VARCHAR(50) NULL,
  Country VARCHAR(50) NULL,
  PostalCode VARCHAR(10) NULL,
  PRIMARY KEY (AddressID));

-- Product Schema 

CREATE TABLE Product (
  ProductID VARCHAR(8) NOT NULL,
  Department VARCHAR(50) NOT NULL,
  ProductName VARCHAR(50) NOT NULL,
  UnitPrice DECIMAL NOT NULL,
  ProductDescription VARCHAR(255) NULL,
  UnitsInStock INT NULL,
  UnitsInOrder INT NULL,
  ItemPicture BLOB NULL,
  PRIMARY KEY (ProductID));
  

CREATE TABLE Shopping_Cart (
  ShoppingCartID VARCHAR(8) NOT NULL,
  UserID VARCHAR(8) NOT NULL,
  Quantity VARCHAR(8),
  PRIMARY KEY (ShoppingCartID));




CREATE TABLE Wishlist (
  WishlistID VARCHAR(8) NOT NULL,
  UserID VARCHAR(8) NOT NULL,
  PRIMARY KEY (WishlistID));



CREATE TABLE Reviews (
  ReviewID VARCHAR(8) NOT NULL,
  ProductID VARCHAR(8) NOT NULL,
  UserID VARCHAR(8) NOT NULL,
  CustomerReview VARCHAR(100) NULL,
  Rating VARCHAR(1) NOT NULL,
  PRIMARY KEY (ReviewID));
  
CREATE TABLE Offer (
  OfferID VARCHAR(8) NOT NULL,
  ProductID VARCHAR(8) NULL,
  OfferAmount VARCHAR(8) NULL,
  PRIMARY KEY (OfferID));
  

--




-- Payments
CREATE TABLE Orders (
  OrderID VARCHAR(8) NOT NULL, 
  UserID VARCHAR(8) NOT NULL,
  ShipperID VARCHAR(8) NOT NULL,
  OrderDate DATE NOT NULL,
  RequiredDate DATE NOT NULL,
  Tax DECIMAL NOT NULL,
  TransactionStatus VARCHAR(50) NOT NULL,
  PaymentDate DATE NOT NULL,
  ItemQuantity INT NULL,
  Price DECIMAL NOT NULL,
  PRIMARY KEY (OrderID));
  
CREATE TABLE Order_Product (
  OrderID VARCHAR(8) NOT NULL,
  ProductID VARCHAR(8) NOT NULL,
  PRIMARY KEY (OrderID,ProductID));
  
  
CREATE TABLE Cart_Product (
  ShoppingCartID VARCHAR(8) NOT NULL,
  ProductID VARCHAR(8) NOT NULL,
  PRIMARY KEY (ShoppingCartID,ProductID));
  
CREATE TABLE WishList_Product (
  WishlistID VARCHAR(8) NOT NULL,
  ProductID VARCHAR(8) NOT NULL,
  PRIMARY KEY (WishlistID,ProductID));

CREATE TABLE Invoice (
  OrderID VARCHAR(8) NOT NULL, 
  InvoiceID VARCHAR(8) NOT NULL,
  Invoice_Type VARCHAR(4) NOT NULL,
  InvoiceAmount DECIMAL NOT NULL,
  PRIMARY KEY (InvoiceID));
  
  
--
-
--




CREATE TABLE Shipper (
  ShipperID VARCHAR(8) NOT NULL,
  ShipperCompanyName VARCHAR(50) NULL,
  ContactName VARCHAR(50) NULL,
  Phone VARCHAR(15) NULL,
  PRIMARY KEY (ShipperID));





-- Payments . Amazon allows you to pay using multiple options only when one of them is giftcard option.


CREATE TABLE Payment (
  PaymentID VARCHAR(8) NOT NULL,
  OrderID VARCHAR(8) NOT NULL,
  Payment_Type VARCHAR(1) NOT NULL,
  PRIMARY KEY (PaymentID));



CREATE TABLE Payment_Card (
  CardID VARCHAR(8) NOT NULL,
  PaymentID VARCHAR(8) NOT NULL,
  CardNumber VARCHAR(20) NOT NULL,
  CardExpMonth INT NOT NULL,
  CardExpYear INT NOT NULL,
  PRIMARY KEY (PaymentID));




CREATE TABLE Payment_Giftcard (
  GiftcardID VARCHAR(8) NOT NULL,
  PaymentID VARCHAR(8) NOT NULL,
  GiftCardAmount VARCHAR(8) NOT NULL,
  GiftCardNumber VARCHAR(16) NOT NULL,
  GiftcardExpMonth VARCHAR(2) NOT NULL,
  GiftcardExpYear VARCHAR(4) NOT NULL,
  PRIMARY KEY (PaymentID));
  
  INSERT INTO User1 (UserID, USER_TYPE, DateCreated) VALUES
('U1234567', 'A', '2023-01-15'),
('U2345678', 'B', '2022-11-30'),
('U3456789', 'C', '2023-02-28'),
('U4567890', 'A', '2022-12-10'),
('U5678901', 'B', '2023-03-17'),
('U6789012', 'C', '2023-01-05');

INSERT INTO Buyer (BuyerID, UserID, Membership, BuyerFirstName, BuyerLastName, PhoneNumber, Email) VALUES
('B0000001', 'U1234567', 'G', 'John', 'Doe', '123-456-7890', 'john.doe@example.com'),
('B0000002', 'U2345678', 'S', 'Jane', 'Smith', '555-123-4567', 'jane.smith@example.com'),
('B0000003', 'U3456789', 'G', 'Michael', 'Johnson', '999-888-7777', 'michael.johnson@example.com'),
('B0000004', 'U4567890', 'S', 'Emily', 'Davis', '111-222-3333', 'emily.davis@example.com'),
('B0000005', 'U5678901', 'G', 'David', 'Wilson', '444-555-6666', 'david.wilson@example.com'),
('B0000006', 'U6789012', 'S', 'Sophia', 'Anderson', '777-999-1111', 'sophia.anderson@example.com');

INSERT INTO Seller (SellerID, UserID, CompanyName, SellerFirstName, SellerLastName, PhoneNumber, Email, Logo) VALUES
('S0000001', 'U1234567', 'ABC Company', 'John', 'Doe', '123-456-7890', 'john.doe@example.com', NULL),
('S0000002', 'U2345678', 'XYZ Inc.', 'Jane', 'Smith', '555-123-4567', 'jane.smith@example.com', NULL),
('S0000003', 'U3456789', '123 Corporation', 'Michael', 'Johnson', '999-888-7777', 'michael.johnson@example.com', NULL),
('S0000004', 'U4567890', 'Acme Co.', 'Emily', 'Davis', '111-222-3333', 'emily.davis@example.com', NULL),
('S0000005', 'U5678901', 'PQR Corporation', 'David', 'Wilson', '444-555-6666', 'david.wilson@example.com', NULL),
('S0000006', 'U6789012', 'ABC Corporation', 'Sophia', 'Anderson', '777-999-1111', 'sophia.anderson@example.com', NULL);

INSERT INTO Address (AddressID, UserID, Address_Type, AddressLine1, City, Province, Country, PostalCode) VALUES
('A0000001', 'U1234567', 'Billing', '123 Main Street', 'New York', 'New York', 'United States', '10001'),
('A0000002', 'U2345678', 'Shipping', '456 Elm Avenue', 'Los Angeles', 'California', 'United States', '90001'),
('A0000003', 'U3456789', 'Billing', '789 Oak Drive', 'Chicago', 'Illinois', 'United States', '60601'),
('A0000004', 'U4567890', 'Shipping', '321 Maple Road', 'Houston', 'Texas', 'United States', '77001'),
('A0000005', 'U5678901', 'Billing', '654 Pine Lane', 'Miami', 'Florida', 'United States', '33101'),
('A0000006', 'U6789012', 'Shipping', '987 Cedar Street', 'Seattle', 'Washington', 'United States', '98101');

INSERT INTO Product (ProductID, Department, ProductName, UnitPrice, ProductDescription, UnitsInStock, UnitsInOrder, ItemPicture) VALUES
('P0000001', 'Electronics', 'Smartphone', 599.99, 'A high-end smartphone with advanced features.', 100, 10, NULL),
('P0000002', 'Clothing', 'T-Shirt', 19.99, 'A comfortable and stylish t-shirt for everyday wear.', 50, 5, NULL),
('P0000003', 'Home Appliances', 'Coffee Maker', 39.99, 'A programmable coffee maker for brewing your favorite coffee.', 30, 8, NULL),
('P0000004', 'Electronics', 'Headphones', 149.99, 'Wireless headphones with noise-canceling technology.', 20, 2, NULL),
('P0000005', 'Books', 'Fantasy Novel', 12.99, 'An exciting fantasy novel filled with magic and adventure.', 80, 15, NULL),
('P0000006', 'Sports', 'Yoga Mat', 29.99, 'A non-slip yoga mat for comfortable and safe yoga practice.', 40, 6, NULL);

INSERT INTO Shopping_Cart (ShoppingCartID, UserID, Quantity) VALUES
('SC0000001', 'U1234567', '2'),
('SC0000002', 'U2345678', '3'),
('SC0000003', 'U3456789', '1'),
('SC0000004', 'U4567890', '4'),
('SC0000005', 'U5678901', '2'),
('SC0000006', 'U6789012', '3');

INSERT INTO Wishlist (WishlistID, UserID) VALUES
('W0000001', 'U1234567'),
('W0000002', 'U2345678'),
('W0000003', 'U3456789'),
('W0000004', 'U4567890'),
('W0000005', 'U5678901'),
('W0000006', 'U6789012');

	INSERT INTO Reviews (ReviewID, ProductID, UserID, CustomerReview, Rating) VALUES
('R0000001', 'P0000001', 'U1234567', 'Great smartphone!', '5'),
('R0000002', 'P0000002', 'U2345678', 'Nice t-shirt.', '4'),
('R0000003', 'P0000003', 'U3456789', 'Good coffee maker.', '4'),
('R0000004', 'P0000004', 'U4567890', 'Excellent headphones!', '5'),
('R0000005', 'P0000005', 'U5678901', 'Loved the fantasy novel.', '5'),
('R0000006', 'P0000006', 'U6789012', 'High-quality yoga mat.', '4');

INSERT INTO Offer (OfferID, ProductID, OfferAmount) VALUES
('O0000001', 'P0000001', '500'),
('O0000002', 'P0000002', '15'),
('O0000003', 'P0000003', '35'),
('O0000004', 'P0000004', '130'),
('O0000005', 'P0000005', '10'),
('O0000006', 'P0000006', '25');

INSERT INTO Orders (OrderID, UserID, ShipperID, OrderDate, RequiredDate, Tax, TransactionStatus, PaymentDate, ItemQuantity, Price) VALUES
('ORD00001', 'U1234567', 'SHP00001', '2023-06-01', '2023-06-15', 10.0, 'Pending', '2023-06-05', 5, 99.99),
('ORD00002', 'U2345678', 'SHP00002', '2023-06-02', '2023-06-16', 7.5, 'Completed', '2023-06-06', 3, 49.99),
('ORD00003', 'U3456789', 'SHP00001', '2023-06-03', '2023-06-17', 5.0, 'Shipped', '2023-06-07', 2, 29.99),
('ORD00004', 'U4567890', 'SHP00002', '2023-06-04', '2023-06-18', 12.0, 'Pending', '2023-06-08', 4, 79.99),
('ORD00005', 'U5678901', 'SHP00001', '2023-06-05', '2023-06-19', 9.5, 'Completed', '2023-06-09', 1, 19.99),
('ORD00006', 'U6789012', 'SHP00002', '2023-06-06', '2023-06-20', 8.0, 'Shipped', '2023-06-10', 3, 59.99);

INSERT INTO Order_Product (OrderID, ProductID) VALUES
('ORD00001', 'P0000001'),
('ORD00001', 'P0000002'),
('ORD00002', 'P0000003'),
('ORD00003', 'P0000001'),
('ORD00004', 'P0000004'),
('ORD00004', 'P0000005');

INSERT INTO Cart_Product (ShoppingCartID, ProductID) VALUES
('SC0000001', 'P0000001'),
('SC0000001', 'P0000002'),
('SC0000002', 'P0000003'),
('SC0000003', 'P0000001'),
('SC0000004', 'P0000004'),
('SC0000004', 'P0000005');

INSERT INTO WishList_Product (WishlistID, ProductID) VALUES
('W0000001', 'P0000001'),
('W0000001', 'P0000002'),
('W0000002', 'P0000003'),
('W0000003', 'P0000001'),
('W0000004', 'P0000004'),
('W0000004', 'P0000005');

INSERT INTO Invoice (OrderID, InvoiceID, Invoice_Type, InvoiceAmount) VALUES
('ORD00001', 'INV00001', 'Type1', 100.50),
('ORD00002', 'INV00002', 'Type2', 75.25),
('ORD00003', 'INV00003', 'Type1', 50.75),
('ORD00004', 'INV00004', 'Type2', 120.00),
('ORD00005', 'INV00005', 'Type1', 85.50),
('ORD00006', 'INV00006', 'Type2', 60.25);

INSERT INTO Shipper (ShipperID, ShipperCompanyName, ContactName, Phone) VALUES
('SHP00001', 'Company A', 'John Doe', '123-456-7890'),
('SHP00002', 'Company B', 'Jane Smith', '987-654-3210'),
('SHP00003', 'Company C', 'Mike Johnson', '555-555-5555');

INSERT INTO Payment (PaymentID, OrderID, Payment_Type) VALUES
('PAY00001', 'ORD00001', 'A'),
('PAY00002', 'ORD00002', 'B'),
('PAY00003', 'ORD00003', 'C'),
('PAY00004', 'ORD00004', 'A'),
('PAY00005', 'ORD00005', 'B'),
('PAY00006', 'ORD00006', 'C');

INSERT INTO Payment_Card (CardID, PaymentID, CardNumber, CardExpMonth, CardExpYear) VALUES
('CARD00001', 'PAY00001', '1234567890123456', 12, 2025),
('CARD00002', 'PAY00002', '9876543210987654', 6, 2024),
('CARD00003', 'PAY00003', '5678901234567890', 9, 2023);

INSERT INTO Payment_Giftcard (GiftcardID, PaymentID, GiftCardAmount, GiftCardNumber, GiftcardExpMonth, GiftcardExpYear) VALUES
('GIFTCARD0001', 'PAY00001', '100.00', '1234567890123456', '12', '2025'),
('GIFTCARD0002', 'PAY00002', '50.00', '9876543210987654', '06', '2024'),
('GIFTCARD0003', 'PAY00003', '75.00', '5678901234567890', '09', '2023');



