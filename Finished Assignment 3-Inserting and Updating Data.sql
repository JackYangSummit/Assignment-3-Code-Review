/*
*********************************************************************
 Java Programming 2 - Summit Academy OIC
 Dr. Mary Lebens
 
Module 3 Assignment

Use the Northwind database for this assignment. Use the
instructions in the comments to write the SQL statements
for this assignment.
*********************************************************************
*/
Use Northwind;
/*
1. Insert a new record into the Employees table that populates
   the columns for last name, first name, title, birth date and hire date. 
   Populate the columns with the following values: 
    - your name
    - job title: software developer
    - birth date: 2002-02-20
    - hire date: 2022-09-06
*/
 insert into Employees (LastName, FirstName, Title, Birthdate, HireDate)
 Values ('Yang', 'Jack', 'software developer', '2000-01-15', '2023-01-01');

 /*
 2. Display the record from the employees table that
    contains your name and title.
*/
  select * from Employees 
  where LastName = 'Yang';
  
 /*
3. Delete the record from the employees table that contains your
    name and title.
*/
 
delete from Employees
where EmployeeID= 10;

/*
4. Insert a new record into the products table with a product name
    that is your favorite food, a unit price that is $4.55, supplier ID 26, and category ID 5.
*/
 
insert into Products(ProductName, UnitPrice, SupplierID, CategoryID)
values ('Chicken Wings', 4.55, 26, 5);

/*
5. Display the new record you added to the products table 
where the product name is your favorite food.
*/
 
 select * from Products
 where ProductName='chicken wings';

/*
6. Add a new record to the Categories table where the 
   CategoryName describes the category for your favorite food.
   Use category ID 9.
   Also add a description for the category.
   (For example, if your favorite food is frozen pizza, then 
   the category would be Frozen Foods and the description would
   be "Frozen meals and desserts".)
*/
 
 insert into Categories(CategoryID, CategoryName, Description)
values (9, 'chicken', 'chicken wings');


/*
7. Display the new record that you added to the categories table
   with your category name.
*/
 
select * from Categories
where CategoryName = 'chicken';

/*
8 Write down the category ID for your new category.
   Update the record for your favorite food in the products
   table with the category ID for your new category.
*/
 
update Products set CategoryID = 9
where ProductName='chicken';

/*
9. Display the record for your favorite food in the products
   table to ensure the category ID was correctly updated.
*/
 
select ProductName from Products
where CategoryID=9;


/*
10. Insert a record into the suppliers table.
    The record should contain the following values:
    - Supplier ID 30
	- Your school's name as the CompanyName
	- Your name as the ContactName
	- Manager as the ContactTitle
	- 123 Sesame Street as the address
    - Saint Paul as the city
*/
 
 insert into Suppliers(SupplierID, CompanyName, ContactName, ContactTitle, Address, City)
 values (30, 'SAOIC', 'Jack Yang', 'Manager', '123 Sesame St', 'Saint Paul');
 
 
/*
11. Display the new record that you created in the suppliers
    table to ensure it was inserted correctly.
*/
 
 select * from Suppliers
 where SupplierID = 30;

/*
12. Write down the supplier ID for the new record you inserted into
    the suppliers table.
	Update the record in the products table that contains
	your favorite food with the supplier ID.
*/
 
update Products set SupplierID = 30
where ProductName='chicken';

/*
13. Display the product name for your favorite food,
    the category name, the category description, 
	the supplier's company name, and the supplier's
	contact name. 
    (Hint: Use a JOIN to retrieve data from more than one table.)
*/
 
select p.ProductName, c.CategoryName, c.Description, s.CompanyName, s.ContactName
from products p
join categories c on p.CategoryID = c.CategoryID
join suppliers s on p.SupplierID = s.SupplierID
where p.ProductName = 'chicken wings';

/*
14. Display the product name for your favorite food,
    the company name for the supplier, the contact name
	for the supplier, and the address for the supplier.
    (Hint: Use a JOIN to retrieve data from more than one table.)
*/
 
select p.ProductName, s.Address, s.CompanyName, s.ContactName
from products p
join categories c on p.CategoryID = c.CategoryID
join suppliers s on p.SupplierID = s.SupplierID
where p.ProductName = 'chicken wings';

/* 15. Your boss has asked you for a list of orders for
       the employee Janet Leverling. 
       The list should contain the order ID, the company name
	   of the customer, and the name of the employee who
	   helped place the order.
       (Hint: Use a JOIN to retrieve data from more than one table.)
*/
 
select o.orderID, c.CompanyName, e.FirstName, e.LastName
from Orders o
join Customers c on o.CustomerID = c.CustomerID
join Employees e on o.EmployeeID = e.EmployeeID
where e.LastName = 'Leverling' and e.FirstName = 'Janet';



