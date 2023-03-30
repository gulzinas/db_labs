--CREATE database flower_shop;



/*1
declare @a int = 10, @b int = 15, @c int = 0

IF (@c >= 0)
BEGIN
    SET @c = @a + @b + @c
    PRINT 'The sum of @a and @b is: ' + CAST(@c AS VARCHAR(10))
END
ELSE
BEGIN
    ROLLBACK TRANSACTION
END*/



/*2
CREATE TRIGGER check_last_name
ON customers
FOR INSERT
AS
BEGIN
    DECLARE @last_name NVARCHAR(50)

    SELECT @last_name = last_name
    FROM inserted

    IF (@last_name IS NULL)
    BEGIN
        ROLLBACK TRANSACTION
    END
END
*/



/*3 
CREATE TRIGGER tr_customers_last_name
ON customers
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE last_name IS NULL)
    BEGIN
        ROLLBACK TRANSACTION
        RAISERROR ('Last name must be filled in for customer');
    END
END*/





/*USE flower_shop
CREATE TABLE customers (
    customer_id int not null primary key identity(1,1),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE flowers (
    flower_id int not null primary key identity(1,1),
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    availability VARCHAR(10) NOT NULL
);

CREATE TABLE orders (
    order_id int not null primary key identity(1,1),
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    id_customer int foreign key references customers(customer_id) not null,
    id_flower  int foreign key references flowers(flower_id) not null
);

CREATE TABLE employees (
    employee_id int not null primary key identity(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

CREATE TABLE deliveries (
    delivery_id int not null primary key identity(1,1),
    delivery_date DATE NOT NULL,
    delivery_address VARCHAR(255) NOT NULL,
    id_order int foreign key references orders(order_id) not null,
    id_employee int foreign key references employees(employee_id) not null
);

INSERT INTO customers (first_name, last_name, email, phone_number)
VALUES
    ('John', 'Doe', 'johndoe@email.com', '555-555-5555'),
    ('Jane', 'Doe', 'janedoe@email.com', '555-555-5556'),
    ('Michael', 'Smith', 'michaelsmith@email.com', '555-555-5557'),
    ('Emily', 'Johnson', 'emilyjohnson@email.com', '555-555-5558'),
    ('William', 'Brown', 'williambrown@email.com', '555-555-5559');


INSERT INTO Flowers (name, price, description, image_url, availability)
VALUES
    ('Red Rose', 10.99, 'A bouquet of 6 red roses', 'https://www.example.com/red_rose.jpg', 'true'),
    ('Yellow Daisy', 5.99, 'A bouquet of 12 yellow daisies', 'https://www.example.com/yellow_daisy.jpg', 'true'),
    ('White Lilies', 15.99, 'A bouquet of 8 white lilies', 'https://www.example.com/white_lilies.jpg', 'true'),
    ('Pink Peonies', 20.99, 'A bouquet of 5 pink peonies', 'https://www.example.com/pink_peonies.jpg', 'false'),
    ('Purple Orchids', 25.99, 'A bouquet of 6 purple orchids', 'https://www.example.com/purple_orchids.jpg', 'true');

INSERT INTO Orders (id_customer, id_flower, quantity, order_date, total_price)
VALUES
    (1, 1, 2, '2022-12-01', 21.98),
    (2, 3, 3, '2022-11-15', 47.97),
    (1, 5, 1, '2022-12-20', 25.99),
    (3, 2, 5, '2022-11-01', 29.95),
    (2, 4, 2, '2022-10-05', 41.98);

INSERT INTO Employees (first_name, last_name, position, hire_date, salary)
VALUES
    ('John', 'Doe', 'Manager', '2021-01-01', 65000),
    ('Jane', 'Smith', 'Assistant Manager', '2021-03-01', 55000),
    ('Bob', 'Johnson', 'Florist', '2021-05-01', 45000),
    ('Alice', 'Brown', 'Delivery Driver', '2021-07-01', 35000),
    ('Charlie', 'Davis', 'Receptionist', '2021-09-01', 30000);

INSERT INTO deliveries(id_order, id_employee, delivery_date, delivery_address)
VALUES
    (1, 1, '2022-01-01', '123 Main St'),
    (2, 2, '2022-02-01', '456 Oak Ave'),
    (3, 3, '2022-03-01', '789 Pine St'),
    (4, 4, '2022-04-01', '246 Maple Rd'),
    (5, 5, '2022-05-01', '369 Cedar Ln');*/




/*USE flower_shop
INSERT INTO customers (first_name, email, phone_number)
VALUES
    ('Guzi','gulzina@gmail.com', '0700573679');

	*/

