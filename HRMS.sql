create database hrms;
use hrms;


CREATE TABLE Department (
  Department_ID INT PRIMARY KEY,
  Department_Name VARCHAR(50) NOT NULL
);


CREATE TABLE Employee (
  Employee_ID INT PRIMARY KEY,
  Username VARCHAR(50) UNIQUE NOT NULL,
  Password VARCHAR(50) NOT NULL,
  First_Name VARCHAR(50) NOT NULL,
  Last_Name VARCHAR(50) NOT NULL,
  Email VARCHAR(100) UNIQUE NOT NULL,
  Phone VARCHAR(20),
  Address VARCHAR(200),
  Department_id INT NOT NULL,
  Job_Title VARCHAR(50) NOT NULL,
  Joining_Date DATE NOT NULL,
  Total_Days INT NOT NULL,
  Leaves_Taken INT NOT NULL,
  Leaves_Left INT NOT NULL,
  Role ENUM('Employee', 'HR_Manager', 'CXO','Founder','reporting_manager') NOT NULL,
  FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);



CREATE TABLE Recruitment_Process(
  Recruitment_ID INT PRIMARY KEY,
  Position VARCHAR(50) NOT NULL,
  Department_id INT NOT NULL,
  Job_Description VARCHAR(500) NOT NULL,
  Interview_Rounds INT NOT NULL,
  Round_1_taken_by INT NOT NULL,
  Round_2_taken_by INT NOT NULL,
  FOREIGN KEY (Round_1_taken_by) REFERENCES Employee(Employee_ID),
  FOREIGN KEY (Round_2_taken_by) REFERENCES Employee(Employee_ID),
  FOREIGN KEY (Department_id) REFERENCES Department(Department_ID)
);



CREATE TABLE Team(
  Team_ID INT PRIMARY KEY,
  Team_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Performance_Rating(
  Rating_ID INT PRIMARY KEY,
  Employee_ID INT NOT NULL,
  Reporting_Manager_ID INT NOT NULL,
  Rating DECIMAL(3,1) NOT NULL,
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
  FOREIGN KEY (Reporting_Manager_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Ticket (
  Ticket_ID INT PRIMARY KEY,
  Employee_ID INT NOT NULL,
  CXO_ID INT NOT NULL,
  Description VARCHAR(500) NOT NULL,
  Status ENUM('Open', 'Closed') NOT NULL,
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
  FOREIGN KEY (CXO_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Team_member(
  Team_member_ID INT PRIMARY KEY,
  Team_ID INT NOT NULL,
  Employee_ID INT NOT NULL,
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
  FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
  );
  
  CREATE TABLE Payroll_Details (
  Payroll_ID INT PRIMARY KEY,
  Employee_ID INT NOT NULL,
  Basic_Pay DECIMAL(10, 2) NOT NULL,
  DA DECIMAL(10, 2) NOT NULL,
  TA DECIMAL(10, 2) NOT NULL,
  HRA DECIMAL(10, 2) NOT NULL,
  Insurance DECIMAL(10, 2) NOT NULL,
  Incentives DECIMAL(10, 2) NOT NULL,
  Fixed DECIMAL(10, 2) NOT NULL,
  Variable DECIMAL(10, 2) NOT NULL,
  Appraisal DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);
  
CREATE TABLE Project (
  Project_ID INT PRIMARY KEY,
  Project_Name VARCHAR(255) NOT NULL,
  Start_Date DATE NOT NULL,
  End_Date DATE NOT NULL,
  Status VARCHAR(255) NOT NULL
);