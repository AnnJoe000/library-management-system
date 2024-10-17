CREATE DATABASE lms;

USE lms;

CREATE TABLE Branch 
(
	Branch_no int PRIMARY KEY,
	Manager_Id int,
	Branch_address varchar(20),
	Contact_no int
);
desc Branch;

CREATE TABLE employee
(
	Emp_Id int PRIMARY KEY,
    Emp_name varchar(15),
    designation varchar(15),
    Salary int,
    Branch_no int,
    foreign key (Branch_no) references Branch(Branch_no) on delete cascade
);
desc employee;

CREATE TABLE Books
(
	ISBN INT PRIMARY KEY,
    Book_title VARCHAR(20),
    Category VARCHAR(20),
    Rental_Price VARCHAR(20),
    Bstatus VARCHAR(10),
    Author VARCHAR(20),
    Publisher VARCHAR(20)
);
desc Books;

CREATE TABLE Customer
(
	Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(20),
    Customer_address VARCHAR(20),
    Reg_date DATE
);
desc Customer;

CREATE TABLE Issue
(
	iStatus VARCHAR(10),
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    foreign key (Issued_cust) references CUSTOMER(customer_id) on delete cascade,
    Issued_book_name VARCHAR(20),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Isbn_book) references Books(ISBN) on delete cascade
);
desc Issue;

CREATE TABLE BReturn
(
	RStatus VARCHAR(10),
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(20),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Isbn_book2) references Books(ISBN) on delete cascade
);
desc BReturn;

INSERT INTO Branch(Branch_no ,Manager_Id ,Branch_address ,Contact_no) VALUES
(1,101,"Alappuzha",999999999),
(2,102,"Ernakulam",888888888),
(3,103,"Trissur",777777777),
(4,104,"Kottayam",666666666);
select * from branch;

INSERT INTO employee(Emp_Id ,Emp_name ,designation ,Salary ,Branch_no) VALUES
(11,"Rada","Cashier",25000,1),
(12,"Geetha","Assistant",30000,1),
(13,"Shibu","Cashier",25000,2),
(14,"Biju","Assistant",30000,2),
(15,"Rahul","Cashier",25000,3),
(16,"Rohith","Assistant",30000,3),
(17,"Malavika","Cashier",25000,4),
(18,"Omana","Assistant",30000,4),
(19,"Milan","Manager",75000,1),
(20,"Sukanya","Manager",75000,2),
(21,"Rithika","Manager",75000,3),
(22,"Hari","Manager",75000,4),
(23,"sugu","security",35000,1),
(24,"shilna","trainee",24000,3),
(25,"basil","trainee",24000,3),
(26,"gokul","security",25000,3),
(27,"nauphal","trainee",24000,1),
(28,"shelna","trainee",25000,1),
(29,"priya","trainee",24000,3),
(30,"nair","trainee",25000,1);
select * from employee;


INSERT INTO Books(ISBN ,Book_title ,Category ,Rental_Price ,Bstatus ,Author ,Publisher) VALUES
(1001 ,"Harry Potter" ,"Mystery" ,2200 ,"yes" ,"J.K.Rowling" ,"Basil publications"),
(1002 ,"tin tin" ,"Comic" ,700 ,"yes" ,"Hergé" ,"Steven Moffat"),
(1003 ,"Goosebumbs" ,"Horror" ,700 ,"yes" ,"R.L stine" ,"Steven Moffat"),
(1004 ,"Classical Mythology" ,"Mythology" ,1000 ,"yes" ,"Mark P. O. Morford" ,"Oxford"),
(1005 ,"Clara Callan" ,"Fiction" ,800 ,"yes" ,"Richard Bruce Wright" ,"HarperFlamingo"),
(1006 ,"PLEADING GUILTY" ,"Mystery" ,1000 ,"yes" ,"Scott Turow" ,"Audioworks"),
(1007 ,"Chocolate Jesus" ,"Blues" ,1500 ,"yes" ,"Stephan Jaramillo" ,"Oxford"),
(1008 ,"Pigs in Heaven" ,"Fiction" ,1600 ,"yes" ,"Barbara Kingsolver" ,"Audioworks"),
(1009 ,"Downtown" ,"history" ,700 ,"yes" ,"Anne Rivers Siddons" ,"HarperFlamingo"),
(1010 ," I'll be Seeing You " ,"Mystery" ,250 ,"yes" ,"Mary Higgins Clark" ,"Basil publications"),
(1011 ,"Jane Doe" ,"Blues" ,6300 ,"yes" ,"R. J. Kaiser" ,"Mira Books"),
(1012 ,"The Testament" ,"Comic" ,500 ,"yes" ,"John Grisham" ,"Dell"),
(1013 ,"Airframe" ,"Horror" ,5500 ,"yes" ,"Michael Crichton" ,"Audioworks"),
(1014 ,"Digest" ,"Comic" ,24 ,"yes" ,"manorama" ,"H&C"),
(1015 ,"Balarama" ,"Comic" ,20 ,"yes" ,"manorama" ,"H&C");
select * from books;

INSERT INTO Customer(Customer_Id ,Customer_name ,Customer_address ,Reg_date) VALUES 
(1 ,"Tom" ,"Ernakulam" ,"2002-01-01"),
(2 ,"bella" ,"Trissur" ,"2023-01-01"),
(3 ,"stella" ,"Alappuzha" ,"2005-01-01"),
(4 ,"peter" ,"Alappuzha" ,"1999-01-01"),
(5 ,"bony" ,"Ernakulam" ,"2002-01-01"),
(6 ,"vinny" ,"Trissur" ,"2002-01-01"),
(7 ,"rocky" ,"Alappuzha" ,"1997-01-01"),
(8 ,"watt" ,"Trissur" ,"1996-01-01"),
(9 ,"krish" ,"Ernakulam" ,"2023-01-01"),
(10 ,"jacob" ,"Ernakulam" ,"2008-01-01");
select * from Customer;

INSERT INTO Issue(iStatus ,Issue_Id ,Issued_cust ,Issued_book_name ,Issue_date ,Isbn_book) VALUES 
("yes" ,1 ,1 ,"The Testament","2000-01-01" ,1012),
("yes" ,2 ,8 ,"Classical Mythology","1996-01-01" ,1004),
("yes" ,3 ,7 ,"Harry Potter","2023-06-01" ,1001),
("yes" ,4 ,5 ,"Jane Doe","2002-01-01" ,1011),
("yes" ,5 ,3 ,"I'll be Seeing You ","2005-01-01" ,1010),
("yes" ,6 ,7 ,"PLEADING GUILTY ","2005-01-01" ,1006);
select * from issue;

INSERT INTO BReturn(RStatus,Return_Id,Return_cust,Return_book_name,Return_date ,Isbn_book2) VALUES
("yes",1,7,"Harry Potter","1997-03-01" ,1001),
("yes",2,5,"Jane Doe","2002-04-01" ,1011),
("yes",3,1,"The Testament","2000-07-01",1012);
select * from BReturn;

-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title ,Category ,Rental_Price FROM Books;

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name,Salary FROM Employee order by salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT t1.Issued_book_name,t2.Customer_name from Issue t1,Customer t2 where t1.Issued_cust=t2.Customer_Id;

-- 4. Display the total count of books in each category.
SELECT Category,count(ISBN) as "book count" FROM books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_name ,designation FROM employee WHERE Salary>50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT Customer.Customer_name FROM Customer
LEFT JOIN Issue ON Customer.Customer_Id = Issue.Issued_cust WHERE Customer.Reg_date < '2022-01-01' AND Issue.Issue_Id IS NULL;

-- 7. Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_no,COUNT(Emp_Id) AS 'Employee count' FROM employee GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023. 
SELECT Customer.Customer_name FROM Customer
LEFT JOIN Issue ON Customer.Customer_Id = Issue.Issued_cust WHERE Issue.Issue_date< '2023-06-30' AND Issue.Issue_date>='2023-06-01';

-- 9. Retrieve book_title from book table containing history. 
SELECT Book_title FROM Books where Category='history';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
SELECT Branch.Branch_no, COUNT(employee.Emp_Id) AS Employee_Count
FROM Branch LEFT JOIN employee ON Branch.Branch_no = employee.Branch_no
GROUP BY Branch.Branch_no
HAVING COUNT(employee.Emp_Id) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT Branch.Branch_no,employee.Emp_name
FROM Branch LEFT JOIN employee ON Branch.Branch_no = employee.Branch_no
WHERE employee.designation ="Manager";

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
SELECT distinct(Customer.Customer_name) FROM Customer ,books,issue
WHERE books.Rental_Price>25 and issue.iStatus='yes' and customer.Customer_Id=issue.Issued_cust and books.ISBN=issue.Isbn_book;

